const fs = require("fs");
// Object to fit to WebAssembly Runtime
let Module = {};

/**
 * MEMORY MANAGEMENT
 */
const WASM_PAGE_SIZE = 65536;
const MIN_TOTAL_MEMORY = 16777216;
let TOTAL_STACK = 5242880; 
let TOTAL_MEMORY = 16777216;

let HEAP,
/** @type {ArrayBuffer} */
  buffer,
/** @type {Int8Array} */
  HEAP8,
/** @type {Uint8Array} */
  HEAPU8,
/** @type {Int16Array} */
  HEAP16,
/** @type {Uint16Array} */
  HEAPU16,
/** @type {Int32Array} */
  HEAP32,
/** @type {Uint32Array} */
  HEAPU32,
/** @type {Float32Array} */
  HEAPF32,
/** @type {Float64Array} */
  HEAPF64;


let STATIC_BASE, STATICTOP, staticSealed; // static area
let STACK_BASE, STACKTOP, STACK_MAX; // stack area
let DYNAMIC_BASE, DYNAMICTOP_PTR; // dynamic area handled by sbrk
// Initializing memory constants
STATIC_BASE = STATICTOP = STACK_BASE = STACKTOP = STACK_MAX = DYNAMIC_BASE = DYNAMICTOP_PTR = 0;
staticSealed = false;




Module['reallocBuffer'] = wasmReallocBuffer;
/**
 * This Code is not necessary as far as I can tell.
 */
// var byteLength;
// try {
//   byteLength = Function.prototype.call.bind(Object.getOwnPropertyDescriptor(ArrayBuffer.prototype, 'byteLength').get);
//   byteLength(new ArrayBuffer(4)); // can fail on older ie
// } catch(e) { // can fail on older node/v8
//   byteLength = function(buffer) { return buffer.byteLength; };
// }
// Initialize the runtime's memory
// check for full engine support (use string 'subarray' to avoid closure compiler confusion)
// assert(typeof Int32Array !== 'undefined' && typeof Float64Array !== 'undefined' && Int32Array.prototype.subarray !== undefined && Int32Array.prototype.set !== undefined,
    //    'JS engine does not provide full typed array support');


if (TOTAL_MEMORY < TOTAL_STACK) 
    console.warn('TOTAL_MEMORY should be larger than TOTAL_STACK, was ' 
        + TOTAL_MEMORY + '! (TOTAL_STACK=' + TOTAL_STACK + ')');

// Initializing buffer
// Use a provided buffer, if there is one, or else allocate a new one
  // Use a WebAssembly memory where available
assert(TOTAL_MEMORY % WASM_PAGE_SIZE === 0);
Module['wasmMemory'] = new WebAssembly.Memory({ 'initial': TOTAL_MEMORY / WASM_PAGE_SIZE});
buffer = Module['wasmMemory'].buffer;
assert(buffer.byteLength === TOTAL_MEMORY);
Module['buffer'] = buffer;
updateGlobalBufferViews();

/**
 * Memory constants
 */
staticSealed = false;
const GLOBAL_BASE = 1024;
const STATICBUMP = 2704; // Static size
STATIC_BASE = GLOBAL_BASE;
STATICTOP = STATIC_BASE + STATICBUMP; // Global base
const STACK_ALIGN = 16; // 8 Byte Alignment

DYNAMICTOP_PTR = staticAlloc(4);
STACK_BASE = STACKTOP = alignMemory(STATICTOP);
STACK_MAX = STACK_BASE + TOTAL_STACK;
DYNAMIC_BASE = alignMemory(STACK_MAX);

staticSealed = true; // seal the static portion of memory

HEAP32[DYNAMICTOP_PTR>>2] = DYNAMIC_BASE;

// Sanity check for dynamic base.
assert(DYNAMIC_BASE < TOTAL_MEMORY, "TOTAL_MEMORY not big enough for stack");

/**
 * Aligns memory given a factor, if the factor is not defined, it uses STACK_ALIGN
 * @param {number} size 
 * @param {number} factor 
 */
function alignMemory(size, factor) {
  if (!factor) factor = STACK_ALIGN; // stack alignment (16-byte) by default
  var ret = size = Math.ceil(size / factor) * factor;
  return ret;
}
/**
 * Allocates a given size on the global static 
 * @param {number} size 
 */
function staticAlloc(size) {
  assert(!staticSealed);
  var ret = STATICTOP;
  STATICTOP = (STATICTOP + size + 15) & -16;
  return ret;
}


/**
 * Fails with stack overflow error
 * @param {size} allocSize 
 */
function abortStackOverflow(allocSize) {
  abort('Stack overflow! Attempted to allocate ' + allocSize + ' bytes on the stack, but stack has only ' + (STACK_MAX - stackSave() + allocSize) + ' bytes available!');
}
/**
 * Abort function from Emscripten
 * Modified(dherr3): I have removed the printing with decoractors
 * part of it and simple now it simple throws an error.
 * @param {string} what 
 */
function abort(what) {
  if (what !== undefined) {
    console.log(what);
    console.warn(what); // Replace 
    what = JSON.stringify(what)
  } else {
    what = '';
  }

  ABORT = true;
  EXITSTATUS = 1;
  const output = new Error(what);
  throw output;
}
/**
 * Checks for condition if false it aborts the program 
 * @param {boolean} condition 
 * @param {string} text 
 */
function assert(condition, text) {
  if (!condition) {
    abort('Assertion failed: ' + text);
  }
}
/**
 *  Error thrown by Wasm's 
 */
function abortOnCannotGrowMemory() {
  abort('Out-of-memory: Cannot enlarge memory arrays.');
}
/**
 * Sets the error
 * TODO (dherre3): Still need to understand how this works
 * @param {number} value 
 */
function ___setErrNo(value) {
    if (Module['___errno_location']) HEAP32[((Module['___errno_location']())>>2)]=value;
    else console.warn('failed to set errno from JS');
    return value;
} 

/**
 * Updating the big module buffer. 
 * @param {Array<byte>} buf 
 */
function updateGlobalBuffer(buf) {
    Module['buffer'] = buffer = buf;
}

/**
 * Gets total memory for the sytem.
 */
function getTotalMemory() {
  return TOTAL_MEMORY;
}
/**
 * Updating global buffer views 
 */  
function updateGlobalBufferViews() {
    Module['HEAP8'] = HEAP8 = new Int8Array(buffer);
    Module['HEAP16'] = HEAP16 = new Int16Array(buffer);
    Module['HEAP32'] = HEAP32 = new Int32Array(buffer);
    Module['HEAPU8'] = HEAPU8 = new Uint8Array(buffer);
    Module['HEAPU16'] = HEAPU16 = new Uint16Array(buffer);
    Module['HEAPU32'] = HEAPU32 = new Uint32Array(buffer);
    Module['HEAPF32'] = HEAPF32 = new Float32Array(buffer);
    Module['HEAPF64'] = HEAPF64 = new Float64Array(buffer);
}
/**
 * Size to use vuffer and reallocate
 * @param {number} size 
 */
function wasmReallocBuffer(size) {
    // Align the size to be a WASM_PAGE_SIZE
    size = alignUp(size, WASM_PAGE_SIZE); // round up to wasm page size
    var old = Module['buffer'];
    var oldSize = old.byteLength;
    try {
        var result = Module['wasmMemory'].grow((size - oldSize) / WASM_PAGE_SIZE); // .grow() takes a delta compared to the previous size
        if (result !== (-1 | 0)) {
            // success in native wasm memory growth, get the buffer from the memory
            return Module['buffer'] = Module['wasmMemory'].buffer;
        } else {
            return null;
        }
    } catch(e) {
        console.error('Module.reallocBuffer: Attempted to grow from ' + oldSize  + ' bytes to ' + size + ' bytes, but got error: ' + e);
        return null;
    }
}
/**
 * Used to align memory
 * @param {number} x 
 * @param {number} multiple 
 */
function alignUp(x, multiple) {
    if (x % multiple > 0) {
      x += multiple - (x % multiple);
    }
    return x;
  }
/**
 * Enlarges memory, used by the _sbrk() call in WebAssembly
 */
function enlargeMemory() {
    // TOTAL_MEMORY is the current size of the actual array, and DYNAMICTOP is the new top.
    assert(HEAP32[DYNAMICTOP_PTR>>2] > TOTAL_MEMORY); // This function should only ever be called after the ceiling of the dynamic heap has already been bumped to exceed the current total size of the asm.js heap.


    const PAGE_MULTIPLE =  WASM_PAGE_SIZE; // In wasm, heap size must be a multiple of 64KB. In asm.js, they need to be multiples of 16MB.
    const LIMIT = 2147483648 - PAGE_MULTIPLE; // We can do one page short of 2GB as theoretical maximum.

    if (HEAP32[DYNAMICTOP_PTR>>2] > LIMIT) {
        console.warn('Cannot enlarge memory, asked to go up to ' + HEAP32[DYNAMICTOP_PTR>>2] + ' bytes, but the limit is ' + LIMIT + ' bytes!');
        return false;
    }

    let OLD_TOTAL_MEMORY = TOTAL_MEMORY;
    TOTAL_MEMORY = Math.max(TOTAL_MEMORY, MIN_TOTAL_MEMORY); // So the loop below will not be infinite, and minimum asm.js memory size is 16MB.

    while (TOTAL_MEMORY < HEAP32[DYNAMICTOP_PTR>>2]) { // Keep incrementing the heap size as long as it's less than what is requested.
        if (TOTAL_MEMORY <= 536870912) {
            TOTAL_MEMORY = alignUp(2 * TOTAL_MEMORY, PAGE_MULTIPLE); // Simple heuristic: double until 1GB...
        } else {
            TOTAL_MEMORY = Math.min(alignUp((3 * TOTAL_MEMORY + 2147483648) / 4, PAGE_MULTIPLE), LIMIT); // ..., but after that, add smaller increments towards 2GB, which we cannot reach
        }
    }

    const start = Date.now();

    let replacement = Module['reallocBuffer'](TOTAL_MEMORY);
    if (!replacement || replacement.byteLength != TOTAL_MEMORY) {
    console.warn('Failed to grow the heap from ' + OLD_TOTAL_MEMORY + ' bytes to ' + TOTAL_MEMORY + ' bytes, not enough memory!');
    if (replacement) {
        console.warn('Expected to get back a buffer of size ' + TOTAL_MEMORY + ' bytes, but instead got back a buffer of size ' + replacement.byteLength);
    }
    // restore the state to before this call, we failed
    TOTAL_MEMORY = OLD_TOTAL_MEMORY;
    return false;
    }

    // everything worked
    updateGlobalBuffer(replacement);
    updateGlobalBufferViews();

    console.warn('enlarged memory arrays from ' + OLD_TOTAL_MEMORY + ' to ' + TOTAL_MEMORY + ', took ' + (Date.now() - start) + ' ms (has ArrayBuffer.transfer? ' + (!!ArrayBuffer.transfer) + ')');
    return true;
}
/**
 * Module definition
 */
Module.env= { 
    "DYNAMICTOP_PTR": DYNAMICTOP_PTR,
    // "ABORT": ABORT,
    "STACKTOP": STACKTOP,
    "STACK_MAX": STACK_MAX,
    "memoryBase": STATIC_BASE, // Not necessary for malloc, but may be useful
    "abort": abort, 
    "assert": assert,
    "memory":Module["wasmMemory"],
    "enlargeMemory": enlargeMemory,
    "getTotalMemory": getTotalMemory,
    "abortOnCannotGrowMemory": abortOnCannotGrowMemory,
    "abortStackOverflow": abortStackOverflow,
    "___setErrNo": ___setErrNo
};
// Start of program
// WebAssembly.instantiate(fs.readFileSync("entry.min.wasm"),Module)
// .then((result)=>{
//     // result.instance.exports.exported_func()
//     Object.assign(Module,result.instance.exports);
// });