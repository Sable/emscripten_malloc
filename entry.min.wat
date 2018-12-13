(module
    ;; Types
    (type $1 (func (param i32) (result i32)))
    (type $2 (func (result i32)))
    (type $3 (func (param i32)))
    (type $4 (func (param i32 i32) (result i32)))
    ;; Imports
    (import "env" "memory" (memory (;0;) 256))
    (import "env" "DYNAMICTOP_PTR" (global $2 i32))
    ;; (import "env" "ABORT" (global $4 i32))
    (import "env" "STACKTOP" (global $5 i32))
    (import "env" "STACK_MAX" (global $6 i32))
    (import "env" "enlargeMemory" (func $enlargeMemory (type $2)))
    (import "env" "___setErrNo" (func $___setErrNo (type $3)))
    (import "env" "memoryBase" (global $0 i32))
    (import "env" "getTotalMemory" (func $getTotalMemory (type $2)))
    (import "env" "abortOnCannotGrowMemory" (func $abortOnCannotGrowMemory (type $2)))
    (import "env" "abortStackOverflow" (func $abortStackOverflow (type $3)))
    ;; Exports
    (export "___errno_location" (func $___errno_location))
    (export "_main" (func $main))
    (export "_main2" (func $main2))
    (export "_sbrk" (func $sbrk))
    (export "_free" (func $free))
    (export "_malloc" (func $malloc))
    
    ;; Mutable globals
    (global $DYNAMICTOP_PTR (mut i32) (get_global $2))
    (global $STACKTOP (mut i32) (get_global $5))
    (global $STACK_MAX (mut i32) (get_global $6))

    ;; Data Segment
    (data (i32.const 1024) "\05\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\03\00\00\00\88\06\00\00\00\04\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0a\ff\ff\ff\ff\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\04")
    (func $main2 (type $4) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    get_global  $STACKTOP
    set_local 19
    get_global  $STACKTOP
    i32.const 32
    i32.add
    set_global  $STACKTOP
    get_global  $STACKTOP
    get_global  $STACK_MAX
    i32.ge_s
    if  ;; label = @1
      i32.const 32
      call $abortStackOverflow
    end
    i32.const 0
    set_local 10
    get_local 0
    set_local 11
    get_local 1
    set_local 12
    i32.const 40
    call $malloc_02
    set_local 15
    get_local 15
    set_local 13
    i32.const 0
    set_local 14
    loop  ;; label = @1
      block  ;; label = @2
        get_local 14
        set_local 16
        get_local 16
        i32.const 10
        i32.lt_s
        set_local 17
        get_local 17
        i32.eqz
        if  ;; label = @3
          br 1 (;@2;)
        end
        get_local 14
        set_local 2
        get_local 2
        i32.const 10
        i32.add
        set_local 3
        get_local 13
        set_local 4
        get_local 14
        set_local 5
        get_local 4
        get_local 5
        i32.const 2
        i32.shl
        i32.add
        set_local 6
        get_local 6
        get_local 3
        i32.store
        get_local 14
        set_local 7
        get_local 7
        i32.const 1
        i32.add
        set_local 8
        get_local 8
        set_local 14
        br 1 (;@1;)
      end
    end
    get_local 13
    set_local 9
    get_local 9
    call $free_02
    get_local 19
    set_global  $STACKTOP
    i32.const 0
    return)
    ;; Implementation, $main
    (func $main (type $4) (param i32 i32) (result i32)
        (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
        get_global $STACKTOP
        set_local 24
        get_global $STACKTOP
        i32.const 32
        i32.add
        set_global $STACKTOP
        get_global $STACKTOP
        get_global  $STACK_MAX
        i32.ge_s
        if  ;; label = @1
        i32.const 32
        call $abortStackOverflow
        end
        i32.const 0
        set_local 12
        get_local 0
        set_local 16
        get_local 1
        set_local 17
        i32.const 0
        set_local 19
        loop  ;; label = @1
        block  ;; label = @2
            get_local 19
            set_local 21
            get_local 21
            i32.const 10
            i32.lt_s
            set_local 22
            get_local 22
            i32.eqz
            if  ;; label = @3
            br 1 (;@2;)
            end
            i32.const 4000000
            call $malloc_02
            set_local 2
            get_local 2
            set_local 18
            get_local 19
            set_local 3
            get_local 3
            i32.const 10
            i32.add
            set_local 4
            get_local 18
            set_local 5
            get_local 19
            set_local 6
            get_local 5
            get_local 6
            i32.const 2
            i32.shl
            i32.add
            set_local 7
            get_local 7
            get_local 4
            i32.store
            get_local 19
            set_local 8
            get_local 8
            i32.const 1
            i32.add
            set_local 9
            get_local 9
            set_local 19
            br 1 (;@1;)
        end
        end
        get_local 18
        set_local 10
        get_local 10
        i32.const 36
        i32.add
        set_local 11
        get_local 11
        i32.load
        set_local 13
        get_local 13
        set_local 20
        get_local 18
        set_local 14
        get_local 14
        call $free_02
        get_local 20
        set_local 15
        get_local 24
        set_global $STACKTOP
        get_local 15
        return)
;; SBRC
  (func $sbrk (type $1) (param i32) (result i32)
    (local i32 i32 i32 i32)
    get_global $DYNAMICTOP_PTR
    i32.load
    set_local 1
    get_local 1
    get_local 0
    i32.add
    set_local 3
    get_local 0
    i32.const 0
    i32.gt_s
    get_local 3
    get_local 1
    i32.lt_s
    i32.and
    get_local 3
    i32.const 0
    i32.lt_s
    i32.or
    if  ;; label = @1
      call $abortOnCannotGrowMemory
      drop
      i32.const 12
      call $___setErrNo 
      i32.const -1
      return
    end
    get_global  $DYNAMICTOP_PTR
    get_local 3
    i32.store
    call $getTotalMemory 
    set_local 4
    get_local 3
    get_local 4
    i32.gt_s
    if  ;; label = @1
      call $enlargeMemory 
      i32.const 0
      i32.eq
      if  ;; label = @2
        get_global  $DYNAMICTOP_PTR
        get_local 1
        i32.store
        i32.const 12
        call $___setErrNo
        i32.const -1
        return
      end
    end
    get_local 1
    return)
;; 
  (func $___errno_location (type $2) (result i32)
    (local i32 i32)
    get_global $STACKTOP
    set_local 1
    i32.const 1648
    return)
(func $malloc (type $1) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    get_global  $STACKTOP
    set_local 1075
    get_global  $STACKTOP
    i32.const 16
    i32.add
    set_global  $STACKTOP
    get_global  $STACKTOP
    get_global  $STACK_MAX
    i32.ge_s
    if  ;; label = @1
      i32.const 16
      call $abortStackOverflow
    end
    get_local 1075
    set_local 85
    get_local 0
    i32.const 245
    i32.lt_u
    set_local 196
    block  ;; label = @1
      get_local 196
      if  ;; label = @2
        get_local 0
        i32.const 11
        i32.lt_u
        set_local 307
        get_local 0
        i32.const 11
        i32.add
        set_local 418
        get_local 418
        i32.const -8
        i32.and
        set_local 529
        get_local 307
        if (result i32)  ;; label = @3
          i32.const 16
        else
          get_local 529
        end
        set_local 640
        get_local 640
        i32.const 3
        i32.shr_u
        set_local 751
        i32.const 1152
        i32.load
        set_local 862
        get_local 862
        get_local 751
        i32.shr_u
        set_local 973
        get_local 973
        i32.const 3
        i32.and
        set_local 86
        get_local 86
        i32.const 0
        i32.eq
        set_local 97
        get_local 97
        i32.eqz
        if  ;; label = @3
          get_local 973
          i32.const 1
          i32.and
          set_local 108
          get_local 108
          i32.const 1
          i32.xor
          set_local 119
          get_local 119
          get_local 751
          i32.add
          set_local 130
          get_local 130
          i32.const 1
          i32.shl
          set_local 141
          i32.const 1192
          get_local 141
          i32.const 2
          i32.shl
          i32.add
          set_local 152
          get_local 152
          i32.const 8
          i32.add
          set_local 163
          get_local 163
          i32.load
          set_local 174
          get_local 174
          i32.const 8
          i32.add
          set_local 185
          get_local 185
          i32.load
          set_local 197
          get_local 197
          get_local 152
          i32.eq
          set_local 208
          get_local 208
          if  ;; label = @4
            i32.const 1
            get_local 130
            i32.shl
            set_local 219
            get_local 219
            i32.const -1
            i32.xor
            set_local 230
            get_local 862
            get_local 230
            i32.and
            set_local 241
            i32.const 1152
            get_local 241
            i32.store
          else
            get_local 197
            i32.const 12
            i32.add
            set_local 252
            get_local 252
            get_local 152
            i32.store
            get_local 163
            get_local 197
            i32.store
          end
          get_local 130
          i32.const 3
          i32.shl
          set_local 263
          get_local 263
          i32.const 3
          i32.or
          set_local 274
          get_local 174
          i32.const 4
          i32.add
          set_local 285
          get_local 285
          get_local 274
          i32.store
          get_local 174
          get_local 263
          i32.add
          set_local 296
          get_local 296
          i32.const 4
          i32.add
          set_local 308
          get_local 308
          i32.load
          set_local 319
          get_local 319
          i32.const 1
          i32.or
          set_local 330
          get_local 308
          get_local 330
          i32.store
          get_local 185
          set_local 6
          get_local 1075
          set_global  $STACKTOP
          get_local 6
          return
        end
        i32.const 1160
        i32.load
        set_local 341
        get_local 640
        get_local 341
        i32.gt_u
        set_local 352
        get_local 352
        if  ;; label = @3
          get_local 973
          i32.const 0
          i32.eq
          set_local 363
          get_local 363
          i32.eqz
          if  ;; label = @4
            get_local 973
            get_local 751
            i32.shl
            set_local 374
            i32.const 2
            get_local 751
            i32.shl
            set_local 385
            i32.const 0
            get_local 385
            i32.sub
            set_local 396
            get_local 385
            get_local 396
            i32.or
            set_local 407
            get_local 374
            get_local 407
            i32.and
            set_local 419
            i32.const 0
            get_local 419
            i32.sub
            set_local 430
            get_local 419
            get_local 430
            i32.and
            set_local 441
            get_local 441
            i32.const -1
            i32.add
            set_local 452
            get_local 452
            i32.const 12
            i32.shr_u
            set_local 463
            get_local 463
            i32.const 16
            i32.and
            set_local 474
            get_local 452
            get_local 474
            i32.shr_u
            set_local 485
            get_local 485
            i32.const 5
            i32.shr_u
            set_local 496
            get_local 496
            i32.const 8
            i32.and
            set_local 507
            get_local 507
            get_local 474
            i32.or
            set_local 518
            get_local 485
            get_local 507
            i32.shr_u
            set_local 530
            get_local 530
            i32.const 2
            i32.shr_u
            set_local 541
            get_local 541
            i32.const 4
            i32.and
            set_local 552
            get_local 518
            get_local 552
            i32.or
            set_local 563
            get_local 530
            get_local 552
            i32.shr_u
            set_local 574
            get_local 574
            i32.const 1
            i32.shr_u
            set_local 585
            get_local 585
            i32.const 2
            i32.and
            set_local 596
            get_local 563
            get_local 596
            i32.or
            set_local 607
            get_local 574
            get_local 596
            i32.shr_u
            set_local 618
            get_local 618
            i32.const 1
            i32.shr_u
            set_local 629
            get_local 629
            i32.const 1
            i32.and
            set_local 641
            get_local 607
            get_local 641
            i32.or
            set_local 652
            get_local 618
            get_local 641
            i32.shr_u
            set_local 663
            get_local 652
            get_local 663
            i32.add
            set_local 674
            get_local 674
            i32.const 1
            i32.shl
            set_local 685
            i32.const 1192
            get_local 685
            i32.const 2
            i32.shl
            i32.add
            set_local 696
            get_local 696
            i32.const 8
            i32.add
            set_local 707
            get_local 707
            i32.load
            set_local 718
            get_local 718
            i32.const 8
            i32.add
            set_local 729
            get_local 729
            i32.load
            set_local 740
            get_local 740
            get_local 696
            i32.eq
            set_local 752
            get_local 752
            if  ;; label = @5
              i32.const 1
              get_local 674
              i32.shl
              set_local 763
              get_local 763
              i32.const -1
              i32.xor
              set_local 774
              get_local 862
              get_local 774
              i32.and
              set_local 785
              i32.const 1152
              get_local 785
              i32.store
              get_local 785
              set_local 974
            else
              get_local 740
              i32.const 12
              i32.add
              set_local 796
              get_local 796
              get_local 696
              i32.store
              get_local 707
              get_local 740
              i32.store
              get_local 862
              set_local 974
            end
            get_local 674
            i32.const 3
            i32.shl
            set_local 807
            get_local 807
            get_local 640
            i32.sub
            set_local 818
            get_local 640
            i32.const 3
            i32.or
            set_local 829
            get_local 718
            i32.const 4
            i32.add
            set_local 840
            get_local 840
            get_local 829
            i32.store
            get_local 718
            get_local 640
            i32.add
            set_local 851
            get_local 818
            i32.const 1
            i32.or
            set_local 863
            get_local 851
            i32.const 4
            i32.add
            set_local 874
            get_local 874
            get_local 863
            i32.store
            get_local 718
            get_local 807
            i32.add
            set_local 885
            get_local 885
            get_local 818
            i32.store
            get_local 341
            i32.const 0
            i32.eq
            set_local 896
            get_local 896
            i32.eqz
            if  ;; label = @5
              i32.const 1172
              i32.load
              set_local 907
              get_local 341
              i32.const 3
              i32.shr_u
              set_local 918
              get_local 918
              i32.const 1
              i32.shl
              set_local 929
              i32.const 1192
              get_local 929
              i32.const 2
              i32.shl
              i32.add
              set_local 940
              i32.const 1
              get_local 918
              i32.shl
              set_local 951
              get_local 974
              get_local 951
              i32.and
              set_local 962
              get_local 962
              i32.const 0
              i32.eq
              set_local 985
              get_local 985
              if  ;; label = @6
                get_local 974
                get_local 951
                i32.or
                set_local 996
                i32.const 1152
                get_local 996
                i32.store
                get_local 940
                i32.const 8
                i32.add
                set_local 68
                get_local 940
                set_local 16
                get_local 68
                set_local 78
              else
                get_local 940
                i32.const 8
                i32.add
                set_local 1007
                get_local 1007
                i32.load
                set_local 1018
                get_local 1018
                set_local 16
                get_local 1007
                set_local 78
              end
              get_local 78
              get_local 907
              i32.store
              get_local 16
              i32.const 12
              i32.add
              set_local 1029
              get_local 1029
              get_local 907
              i32.store
              get_local 907
              i32.const 8
              i32.add
              set_local 1040
              get_local 1040
              get_local 16
              i32.store
              get_local 907
              i32.const 12
              i32.add
              set_local 1051
              get_local 1051
              get_local 940
              i32.store
            end
            i32.const 1160
            get_local 818
            i32.store
            i32.const 1172
            get_local 851
            i32.store
            get_local 729
            set_local 6
            get_local 1075
            set_global  $STACKTOP
            get_local 6
            return
          end
          i32.const 1156
          i32.load
          set_local 1054
          get_local 1054
          i32.const 0
          i32.eq
          set_local 1055
          get_local 1055
          if  ;; label = @4
            get_local 640
            set_local 15
          else
            i32.const 0
            get_local 1054
            i32.sub
            set_local 87
            get_local 1054
            get_local 87
            i32.and
            set_local 88
            get_local 88
            i32.const -1
            i32.add
            set_local 89
            get_local 89
            i32.const 12
            i32.shr_u
            set_local 90
            get_local 90
            i32.const 16
            i32.and
            set_local 91
            get_local 89
            get_local 91
            i32.shr_u
            set_local 92
            get_local 92
            i32.const 5
            i32.shr_u
            set_local 93
            get_local 93
            i32.const 8
            i32.and
            set_local 94
            get_local 94
            get_local 91
            i32.or
            set_local 95
            get_local 92
            get_local 94
            i32.shr_u
            set_local 96
            get_local 96
            i32.const 2
            i32.shr_u
            set_local 98
            get_local 98
            i32.const 4
            i32.and
            set_local 99
            get_local 95
            get_local 99
            i32.or
            set_local 100
            get_local 96
            get_local 99
            i32.shr_u
            set_local 101
            get_local 101
            i32.const 1
            i32.shr_u
            set_local 102
            get_local 102
            i32.const 2
            i32.and
            set_local 103
            get_local 100
            get_local 103
            i32.or
            set_local 104
            get_local 101
            get_local 103
            i32.shr_u
            set_local 105
            get_local 105
            i32.const 1
            i32.shr_u
            set_local 106
            get_local 106
            i32.const 1
            i32.and
            set_local 107
            get_local 104
            get_local 107
            i32.or
            set_local 109
            get_local 105
            get_local 107
            i32.shr_u
            set_local 110
            get_local 109
            get_local 110
            i32.add
            set_local 111
            i32.const 1456
            get_local 111
            i32.const 2
            i32.shl
            i32.add
            set_local 112
            get_local 112
            i32.load
            set_local 113
            get_local 113
            i32.const 4
            i32.add
            set_local 114
            get_local 114
            i32.load
            set_local 115
            get_local 115
            i32.const -8
            i32.and
            set_local 116
            get_local 116
            get_local 640
            i32.sub
            set_local 117
            get_local 113
            i32.const 16
            i32.add
            set_local 118
            get_local 118
            i32.load
            set_local 120
            get_local 120
            i32.const 0
            i32.eq
            set_local 121
            get_local 121
            i32.const 1
            i32.and
            set_local 81
            get_local 113
            i32.const 16
            i32.add
            get_local 81
            i32.const 2
            i32.shl
            i32.add
            set_local 122
            get_local 122
            i32.load
            set_local 123
            get_local 123
            i32.const 0
            i32.eq
            set_local 124
            get_local 124
            if  ;; label = @5
              get_local 113
              set_local 11
              get_local 117
              set_local 13
            else
              get_local 113
              set_local 12
              get_local 117
              set_local 14
              get_local 123
              set_local 126
              loop  ;; label = @6
                block  ;; label = @7
                  get_local 126
                  i32.const 4
                  i32.add
                  set_local 125
                  get_local 125
                  i32.load
                  set_local 127
                  get_local 127
                  i32.const -8
                  i32.and
                  set_local 128
                  get_local 128
                  get_local 640
                  i32.sub
                  set_local 129
                  get_local 129
                  get_local 14
                  i32.lt_u
                  set_local 131
                  get_local 131
                  if (result i32)  ;; label = @8
                    get_local 129
                  else
                    get_local 14
                  end
                  set_local 2
                  get_local 131
                  if (result i32)  ;; label = @8
                    get_local 126
                  else
                    get_local 12
                  end
                  set_local 1
                  get_local 126
                  i32.const 16
                  i32.add
                  set_local 132
                  get_local 132
                  i32.load
                  set_local 133
                  get_local 133
                  i32.const 0
                  i32.eq
                  set_local 134
                  get_local 134
                  i32.const 1
                  i32.and
                  set_local 79
                  get_local 126
                  i32.const 16
                  i32.add
                  get_local 79
                  i32.const 2
                  i32.shl
                  i32.add
                  set_local 135
                  get_local 135
                  i32.load
                  set_local 136
                  get_local 136
                  i32.const 0
                  i32.eq
                  set_local 137
                  get_local 137
                  if  ;; label = @8
                    get_local 1
                    set_local 11
                    get_local 2
                    set_local 13
                    br 1 (;@7;)
                  else
                    get_local 1
                    set_local 12
                    get_local 2
                    set_local 14
                    get_local 136
                    set_local 126
                  end
                  br 1 (;@6;)
                end
              end
            end
            get_local 11
            get_local 640
            i32.add
            set_local 138
            get_local 138
            get_local 11
            i32.gt_u
            set_local 139
            get_local 139
            if  ;; label = @5
              get_local 11
              i32.const 24
              i32.add
              set_local 140
              get_local 140
              i32.load
              set_local 142
              get_local 11
              i32.const 12
              i32.add
              set_local 143
              get_local 143
              i32.load
              set_local 144
              get_local 144
              get_local 11
              i32.eq
              set_local 145
              block  ;; label = @6
                get_local 145
                if  ;; label = @7
                  get_local 11
                  i32.const 20
                  i32.add
                  set_local 150
                  get_local 150
                  i32.load
                  set_local 151
                  get_local 151
                  i32.const 0
                  i32.eq
                  set_local 153
                  get_local 153
                  if  ;; label = @8
                    get_local 11
                    i32.const 16
                    i32.add
                    set_local 154
                    get_local 154
                    i32.load
                    set_local 155
                    get_local 155
                    i32.const 0
                    i32.eq
                    set_local 156
                    get_local 156
                    if  ;; label = @9
                      i32.const 0
                      set_local 52
                      br 3 (;@6;)
                    else
                      get_local 155
                      set_local 38
                      get_local 154
                      set_local 39
                    end
                  else
                    get_local 151
                    set_local 38
                    get_local 150
                    set_local 39
                  end
                  loop  ;; label = @8
                    block  ;; label = @9
                      get_local 38
                      i32.const 20
                      i32.add
                      set_local 157
                      get_local 157
                      i32.load
                      set_local 158
                      get_local 158
                      i32.const 0
                      i32.eq
                      set_local 159
                      get_local 159
                      i32.eqz
                      if  ;; label = @10
                        get_local 158
                        set_local 38
                        get_local 157
                        set_local 39
                        br 2 (;@8;)
                      end
                      get_local 38
                      i32.const 16
                      i32.add
                      set_local 160
                      get_local 160
                      i32.load
                      set_local 161
                      get_local 161
                      i32.const 0
                      i32.eq
                      set_local 162
                      get_local 162
                      if  ;; label = @10
                        br 1 (;@9;)
                      else
                        get_local 161
                        set_local 38
                        get_local 160
                        set_local 39
                      end
                      br 1 (;@8;)
                    end
                  end
                  get_local 39
                  i32.const 0
                  i32.store
                  get_local 38
                  set_local 52
                else
                  get_local 11
                  i32.const 8
                  i32.add
                  set_local 146
                  get_local 146
                  i32.load
                  set_local 147
                  get_local 147
                  i32.const 12
                  i32.add
                  set_local 148
                  get_local 148
                  get_local 144
                  i32.store
                  get_local 144
                  i32.const 8
                  i32.add
                  set_local 149
                  get_local 149
                  get_local 147
                  i32.store
                  get_local 144
                  set_local 52
                end
              end
              get_local 142
              i32.const 0
              i32.eq
              set_local 164
              block  ;; label = @6
                get_local 164
                i32.eqz
                if  ;; label = @7
                  get_local 11
                  i32.const 28
                  i32.add
                  set_local 165
                  get_local 165
                  i32.load
                  set_local 166
                  i32.const 1456
                  get_local 166
                  i32.const 2
                  i32.shl
                  i32.add
                  set_local 167
                  get_local 167
                  i32.load
                  set_local 168
                  get_local 11
                  get_local 168
                  i32.eq
                  set_local 169
                  get_local 169
                  if  ;; label = @8
                    get_local 167
                    get_local 52
                    i32.store
                    get_local 52
                    i32.const 0
                    i32.eq
                    set_local 1056
                    get_local 1056
                    if  ;; label = @9
                      i32.const 1
                      get_local 166
                      i32.shl
                      set_local 170
                      get_local 170
                      i32.const -1
                      i32.xor
                      set_local 171
                      get_local 1054
                      get_local 171
                      i32.and
                      set_local 172
                      i32.const 1156
                      get_local 172
                      i32.store
                      br 3 (;@6;)
                    end
                  else
                    get_local 142
                    i32.const 16
                    i32.add
                    set_local 173
                    get_local 173
                    i32.load
                    set_local 175
                    get_local 175
                    get_local 11
                    i32.ne
                    set_local 176
                    get_local 176
                    i32.const 1
                    i32.and
                    set_local 82
                    get_local 142
                    i32.const 16
                    i32.add
                    get_local 82
                    i32.const 2
                    i32.shl
                    i32.add
                    set_local 177
                    get_local 177
                    get_local 52
                    i32.store
                    get_local 52
                    i32.const 0
                    i32.eq
                    set_local 178
                    get_local 178
                    if  ;; label = @9
                      br 3 (;@6;)
                    end
                  end
                  get_local 52
                  i32.const 24
                  i32.add
                  set_local 179
                  get_local 179
                  get_local 142
                  i32.store
                  get_local 11
                  i32.const 16
                  i32.add
                  set_local 180
                  get_local 180
                  i32.load
                  set_local 181
                  get_local 181
                  i32.const 0
                  i32.eq
                  set_local 182
                  get_local 182
                  i32.eqz
                  if  ;; label = @8
                    get_local 52
                    i32.const 16
                    i32.add
                    set_local 183
                    get_local 183
                    get_local 181
                    i32.store
                    get_local 181
                    i32.const 24
                    i32.add
                    set_local 184
                    get_local 184
                    get_local 52
                    i32.store
                  end
                  get_local 11
                  i32.const 20
                  i32.add
                  set_local 186
                  get_local 186
                  i32.load
                  set_local 187
                  get_local 187
                  i32.const 0
                  i32.eq
                  set_local 188
                  get_local 188
                  i32.eqz
                  if  ;; label = @8
                    get_local 52
                    i32.const 20
                    i32.add
                    set_local 189
                    get_local 189
                    get_local 187
                    i32.store
                    get_local 187
                    i32.const 24
                    i32.add
                    set_local 190
                    get_local 190
                    get_local 52
                    i32.store
                  end
                end
              end
              get_local 13
              i32.const 16
              i32.lt_u
              set_local 191
              get_local 191
              if  ;; label = @6
                get_local 13
                get_local 640
                i32.add
                set_local 192
                get_local 192
                i32.const 3
                i32.or
                set_local 193
                get_local 11
                i32.const 4
                i32.add
                set_local 194
                get_local 194
                get_local 193
                i32.store
                get_local 11
                get_local 192
                i32.add
                set_local 195
                get_local 195
                i32.const 4
                i32.add
                set_local 198
                get_local 198
                i32.load
                set_local 199
                get_local 199
                i32.const 1
                i32.or
                set_local 200
                get_local 198
                get_local 200
                i32.store
              else
                get_local 640
                i32.const 3
                i32.or
                set_local 201
                get_local 11
                i32.const 4
                i32.add
                set_local 202
                get_local 202
                get_local 201
                i32.store
                get_local 13
                i32.const 1
                i32.or
                set_local 203
                get_local 138
                i32.const 4
                i32.add
                set_local 204
                get_local 204
                get_local 203
                i32.store
                get_local 138
                get_local 13
                i32.add
                set_local 205
                get_local 205
                get_local 13
                i32.store
                get_local 341
                i32.const 0
                i32.eq
                set_local 206
                get_local 206
                i32.eqz
                if  ;; label = @7
                  i32.const 1172
                  i32.load
                  set_local 207
                  get_local 341
                  i32.const 3
                  i32.shr_u
                  set_local 209
                  get_local 209
                  i32.const 1
                  i32.shl
                  set_local 210
                  i32.const 1192
                  get_local 210
                  i32.const 2
                  i32.shl
                  i32.add
                  set_local 211
                  i32.const 1
                  get_local 209
                  i32.shl
                  set_local 212
                  get_local 862
                  get_local 212
                  i32.and
                  set_local 213
                  get_local 213
                  i32.const 0
                  i32.eq
                  set_local 214
                  get_local 214
                  if  ;; label = @8
                    get_local 862
                    get_local 212
                    i32.or
                    set_local 215
                    i32.const 1152
                    get_local 215
                    i32.store
                    get_local 211
                    i32.const 8
                    i32.add
                    set_local 69
                    get_local 211
                    set_local 7
                    get_local 69
                    set_local 77
                  else
                    get_local 211
                    i32.const 8
                    i32.add
                    set_local 216
                    get_local 216
                    i32.load
                    set_local 217
                    get_local 217
                    set_local 7
                    get_local 216
                    set_local 77
                  end
                  get_local 77
                  get_local 207
                  i32.store
                  get_local 7
                  i32.const 12
                  i32.add
                  set_local 218
                  get_local 218
                  get_local 207
                  i32.store
                  get_local 207
                  i32.const 8
                  i32.add
                  set_local 220
                  get_local 220
                  get_local 7
                  i32.store
                  get_local 207
                  i32.const 12
                  i32.add
                  set_local 221
                  get_local 221
                  get_local 211
                  i32.store
                end
                i32.const 1160
                get_local 13
                i32.store
                i32.const 1172
                get_local 138
                i32.store
              end
              get_local 11
              i32.const 8
              i32.add
              set_local 222
              get_local 222
              set_local 6
              get_local 1075
              set_global  $STACKTOP
              get_local 6
              return
            else
              get_local 640
              set_local 15
            end
          end
        else
          get_local 640
          set_local 15
        end
      else
        get_local 0
        i32.const -65
        i32.gt_u
        set_local 223
        get_local 223
        if  ;; label = @3
          i32.const -1
          set_local 15
        else
          get_local 0
          i32.const 11
          i32.add
          set_local 224
          get_local 224
          i32.const -8
          i32.and
          set_local 225
          i32.const 1156
          i32.load
          set_local 226
          get_local 226
          i32.const 0
          i32.eq
          set_local 227
          get_local 227
          if  ;; label = @4
            get_local 225
            set_local 15
          else
            i32.const 0
            get_local 225
            i32.sub
            set_local 228
            get_local 224
            i32.const 8
            i32.shr_u
            set_local 229
            get_local 229
            i32.const 0
            i32.eq
            set_local 231
            get_local 231
            if  ;; label = @5
              i32.const 0
              set_local 32
            else
              get_local 225
              i32.const 16777215
              i32.gt_u
              set_local 232
              get_local 232
              if  ;; label = @6
                i32.const 31
                set_local 32
              else
                get_local 229
                i32.const 1048320
                i32.add
                set_local 233
                get_local 233
                i32.const 16
                i32.shr_u
                set_local 234
                get_local 234
                i32.const 8
                i32.and
                set_local 235
                get_local 229
                get_local 235
                i32.shl
                set_local 236
                get_local 236
                i32.const 520192
                i32.add
                set_local 237
                get_local 237
                i32.const 16
                i32.shr_u
                set_local 238
                get_local 238
                i32.const 4
                i32.and
                set_local 239
                get_local 239
                get_local 235
                i32.or
                set_local 240
                get_local 236
                get_local 239
                i32.shl
                set_local 242
                get_local 242
                i32.const 245760
                i32.add
                set_local 243
                get_local 243
                i32.const 16
                i32.shr_u
                set_local 244
                get_local 244
                i32.const 2
                i32.and
                set_local 245
                get_local 240
                get_local 245
                i32.or
                set_local 246
                i32.const 14
                get_local 246
                i32.sub
                set_local 247
                get_local 242
                get_local 245
                i32.shl
                set_local 248
                get_local 248
                i32.const 15
                i32.shr_u
                set_local 249
                get_local 247
                get_local 249
                i32.add
                set_local 250
                get_local 250
                i32.const 1
                i32.shl
                set_local 251
                get_local 250
                i32.const 7
                i32.add
                set_local 253
                get_local 225
                get_local 253
                i32.shr_u
                set_local 254
                get_local 254
                i32.const 1
                i32.and
                set_local 255
                get_local 255
                get_local 251
                i32.or
                set_local 256
                get_local 256
                set_local 32
              end
            end
            i32.const 1456
            get_local 32
            i32.const 2
            i32.shl
            i32.add
            set_local 257
            get_local 257
            i32.load
            set_local 258
            get_local 258
            i32.const 0
            i32.eq
            set_local 259
            block  ;; label = @5
              get_local 259
              if  ;; label = @6
                i32.const 0
                set_local 51
                i32.const 0
                set_local 54
                get_local 228
                set_local 55
                i32.const 57
                set_local 1074
              else
                get_local 32
                i32.const 31
                i32.eq
                set_local 260
                get_local 32
                i32.const 1
                i32.shr_u
                set_local 261
                i32.const 25
                get_local 261
                i32.sub
                set_local 262
                get_local 260
                if (result i32)  ;; label = @7
                  i32.const 0
                else
                  get_local 262
                end
                set_local 264
                get_local 225
                get_local 264
                i32.shl
                set_local 265
                i32.const 0
                set_local 27
                get_local 228
                set_local 30
                get_local 258
                set_local 31
                get_local 265
                set_local 34
                i32.const 0
                set_local 36
                loop  ;; label = @7
                  block  ;; label = @8
                    get_local 31
                    i32.const 4
                    i32.add
                    set_local 266
                    get_local 266
                    i32.load
                    set_local 267
                    get_local 267
                    i32.const -8
                    i32.and
                    set_local 268
                    get_local 268
                    get_local 225
                    i32.sub
                    set_local 269
                    get_local 269
                    get_local 30
                    i32.lt_u
                    set_local 270
                    get_local 270
                    if  ;; label = @9
                      get_local 269
                      i32.const 0
                      i32.eq
                      set_local 271
                      get_local 271
                      if  ;; label = @10
                        i32.const 0
                        set_local 61
                        get_local 31
                        set_local 64
                        get_local 31
                        set_local 65
                        i32.const 61
                        set_local 1074
                        br 5 (;@5;)
                      else
                        get_local 31
                        set_local 43
                        get_local 269
                        set_local 44
                      end
                    else
                      get_local 27
                      set_local 43
                      get_local 30
                      set_local 44
                    end
                    get_local 31
                    i32.const 20
                    i32.add
                    set_local 272
                    get_local 272
                    i32.load
                    set_local 273
                    get_local 34
                    i32.const 31
                    i32.shr_u
                    set_local 275
                    get_local 31
                    i32.const 16
                    i32.add
                    get_local 275
                    i32.const 2
                    i32.shl
                    i32.add
                    set_local 276
                    get_local 276
                    i32.load
                    set_local 277
                    get_local 273
                    i32.const 0
                    i32.eq
                    set_local 278
                    get_local 273
                    get_local 277
                    i32.eq
                    set_local 279
                    get_local 278
                    get_local 279
                    i32.or
                    set_local 1064
                    get_local 1064
                    if (result i32)  ;; label = @9
                      get_local 36
                    else
                      get_local 273
                    end
                    set_local 45
                    get_local 277
                    i32.const 0
                    i32.eq
                    set_local 280
                    get_local 280
                    i32.const 1
                    i32.xor
                    set_local 1060
                    get_local 1060
                    i32.const 1
                    i32.and
                    set_local 281
                    get_local 34
                    get_local 281
                    i32.shl
                    set_local 33
                    get_local 280
                    if  ;; label = @9
                      get_local 45
                      set_local 51
                      get_local 43
                      set_local 54
                      get_local 44
                      set_local 55
                      i32.const 57
                      set_local 1074
                      br 1 (;@8;)
                    else
                      get_local 43
                      set_local 27
                      get_local 44
                      set_local 30
                      get_local 277
                      set_local 31
                      get_local 33
                      set_local 34
                      get_local 45
                      set_local 36
                    end
                    br 1 (;@7;)
                  end
                end
              end
            end
            get_local 1074
            i32.const 57
            i32.eq
            if  ;; label = @5
              get_local 51
              i32.const 0
              i32.eq
              set_local 282
              get_local 54
              i32.const 0
              i32.eq
              set_local 283
              get_local 282
              get_local 283
              i32.and
              set_local 1062
              get_local 1062
              if  ;; label = @6
                i32.const 2
                get_local 32
                i32.shl
                set_local 284
                i32.const 0
                get_local 284
                i32.sub
                set_local 286
                get_local 284
                get_local 286
                i32.or
                set_local 287
                get_local 226
                get_local 287
                i32.and
                set_local 288
                get_local 288
                i32.const 0
                i32.eq
                set_local 289
                get_local 289
                if  ;; label = @7
                  get_local 225
                  set_local 15
                  br 6 (;@1;)
                end
                i32.const 0
                get_local 288
                i32.sub
                set_local 290
                get_local 288
                get_local 290
                i32.and
                set_local 291
                get_local 291
                i32.const -1
                i32.add
                set_local 292
                get_local 292
                i32.const 12
                i32.shr_u
                set_local 293
                get_local 293
                i32.const 16
                i32.and
                set_local 294
                get_local 292
                get_local 294
                i32.shr_u
                set_local 295
                get_local 295
                i32.const 5
                i32.shr_u
                set_local 297
                get_local 297
                i32.const 8
                i32.and
                set_local 298
                get_local 298
                get_local 294
                i32.or
                set_local 299
                get_local 295
                get_local 298
                i32.shr_u
                set_local 300
                get_local 300
                i32.const 2
                i32.shr_u
                set_local 301
                get_local 301
                i32.const 4
                i32.and
                set_local 302
                get_local 299
                get_local 302
                i32.or
                set_local 303
                get_local 300
                get_local 302
                i32.shr_u
                set_local 304
                get_local 304
                i32.const 1
                i32.shr_u
                set_local 305
                get_local 305
                i32.const 2
                i32.and
                set_local 306
                get_local 303
                get_local 306
                i32.or
                set_local 309
                get_local 304
                get_local 306
                i32.shr_u
                set_local 310
                get_local 310
                i32.const 1
                i32.shr_u
                set_local 311
                get_local 311
                i32.const 1
                i32.and
                set_local 312
                get_local 309
                get_local 312
                i32.or
                set_local 313
                get_local 310
                get_local 312
                i32.shr_u
                set_local 314
                get_local 313
                get_local 314
                i32.add
                set_local 315
                i32.const 1456
                get_local 315
                i32.const 2
                i32.shl
                i32.add
                set_local 316
                get_local 316
                i32.load
                set_local 317
                i32.const 0
                set_local 58
                get_local 317
                set_local 63
              else
                get_local 54
                set_local 58
                get_local 51
                set_local 63
              end
              get_local 63
              i32.const 0
              i32.eq
              set_local 318
              get_local 318
              if  ;; label = @6
                get_local 58
                set_local 57
                get_local 55
                set_local 60
              else
                get_local 55
                set_local 61
                get_local 63
                set_local 64
                get_local 58
                set_local 65
                i32.const 61
                set_local 1074
              end
            end
            get_local 1074
            i32.const 61
            i32.eq
            if  ;; label = @5
              loop  ;; label = @6
                block  ;; label = @7
                  i32.const 0
                  set_local 1074
                  get_local 64
                  i32.const 4
                  i32.add
                  set_local 320
                  get_local 320
                  i32.load
                  set_local 321
                  get_local 321
                  i32.const -8
                  i32.and
                  set_local 322
                  get_local 322
                  get_local 225
                  i32.sub
                  set_local 323
                  get_local 323
                  get_local 61
                  i32.lt_u
                  set_local 324
                  get_local 324
                  if (result i32)  ;; label = @8
                    get_local 323
                  else
                    get_local 61
                  end
                  set_local 4
                  get_local 324
                  if (result i32)  ;; label = @8
                    get_local 64
                  else
                    get_local 65
                  end
                  set_local 62
                  get_local 64
                  i32.const 16
                  i32.add
                  set_local 325
                  get_local 325
                  i32.load
                  set_local 326
                  get_local 326
                  i32.const 0
                  i32.eq
                  set_local 327
                  get_local 327
                  i32.const 1
                  i32.and
                  set_local 83
                  get_local 64
                  i32.const 16
                  i32.add
                  get_local 83
                  i32.const 2
                  i32.shl
                  i32.add
                  set_local 328
                  get_local 328
                  i32.load
                  set_local 329
                  get_local 329
                  i32.const 0
                  i32.eq
                  set_local 331
                  get_local 331
                  if  ;; label = @8
                    get_local 62
                    set_local 57
                    get_local 4
                    set_local 60
                    br 1 (;@7;)
                  else
                    get_local 4
                    set_local 61
                    get_local 329
                    set_local 64
                    get_local 62
                    set_local 65
                    i32.const 61
                    set_local 1074
                  end
                  br 1 (;@6;)
                end
              end
            end
            get_local 57
            i32.const 0
            i32.eq
            set_local 332
            get_local 332
            if  ;; label = @5
              get_local 225
              set_local 15
            else
              i32.const 1160
              i32.load
              set_local 333
              get_local 333
              get_local 225
              i32.sub
              set_local 334
              get_local 60
              get_local 334
              i32.lt_u
              set_local 335
              get_local 335
              if  ;; label = @6
                get_local 57
                get_local 225
                i32.add
                set_local 336
                get_local 336
                get_local 57
                i32.gt_u
                set_local 337
                get_local 337
                i32.eqz
                if  ;; label = @7
                  i32.const 0
                  set_local 6
                  get_local 1075
                  set_global  $STACKTOP
                  get_local 6
                  return
                end
                get_local 57
                i32.const 24
                i32.add
                set_local 338
                get_local 338
                i32.load
                set_local 339
                get_local 57
                i32.const 12
                i32.add
                set_local 340
                get_local 340
                i32.load
                set_local 342
                get_local 342
                get_local 57
                i32.eq
                set_local 343
                block  ;; label = @7
                  get_local 343
                  if  ;; label = @8
                    get_local 57
                    i32.const 20
                    i32.add
                    set_local 348
                    get_local 348
                    i32.load
                    set_local 349
                    get_local 349
                    i32.const 0
                    i32.eq
                    set_local 350
                    get_local 350
                    if  ;; label = @9
                      get_local 57
                      i32.const 16
                      i32.add
                      set_local 351
                      get_local 351
                      i32.load
                      set_local 353
                      get_local 353
                      i32.const 0
                      i32.eq
                      set_local 354
                      get_local 354
                      if  ;; label = @10
                        i32.const 0
                        set_local 56
                        br 3 (;@7;)
                      else
                        get_local 353
                        set_local 46
                        get_local 351
                        set_local 47
                      end
                    else
                      get_local 349
                      set_local 46
                      get_local 348
                      set_local 47
                    end
                    loop  ;; label = @9
                      block  ;; label = @10
                        get_local 46
                        i32.const 20
                        i32.add
                        set_local 355
                        get_local 355
                        i32.load
                        set_local 356
                        get_local 356
                        i32.const 0
                        i32.eq
                        set_local 357
                        get_local 357
                        i32.eqz
                        if  ;; label = @11
                          get_local 356
                          set_local 46
                          get_local 355
                          set_local 47
                          br 2 (;@9;)
                        end
                        get_local 46
                        i32.const 16
                        i32.add
                        set_local 358
                        get_local 358
                        i32.load
                        set_local 359
                        get_local 359
                        i32.const 0
                        i32.eq
                        set_local 360
                        get_local 360
                        if  ;; label = @11
                          br 1 (;@10;)
                        else
                          get_local 359
                          set_local 46
                          get_local 358
                          set_local 47
                        end
                        br 1 (;@9;)
                      end
                    end
                    get_local 47
                    i32.const 0
                    i32.store
                    get_local 46
                    set_local 56
                  else
                    get_local 57
                    i32.const 8
                    i32.add
                    set_local 344
                    get_local 344
                    i32.load
                    set_local 345
                    get_local 345
                    i32.const 12
                    i32.add
                    set_local 346
                    get_local 346
                    get_local 342
                    i32.store
                    get_local 342
                    i32.const 8
                    i32.add
                    set_local 347
                    get_local 347
                    get_local 345
                    i32.store
                    get_local 342
                    set_local 56
                  end
                end
                get_local 339
                i32.const 0
                i32.eq
                set_local 361
                block  ;; label = @7
                  get_local 361
                  if  ;; label = @8
                    get_local 226
                    set_local 454
                  else
                    get_local 57
                    i32.const 28
                    i32.add
                    set_local 362
                    get_local 362
                    i32.load
                    set_local 364
                    i32.const 1456
                    get_local 364
                    i32.const 2
                    i32.shl
                    i32.add
                    set_local 365
                    get_local 365
                    i32.load
                    set_local 366
                    get_local 57
                    get_local 366
                    i32.eq
                    set_local 367
                    get_local 367
                    if  ;; label = @9
                      get_local 365
                      get_local 56
                      i32.store
                      get_local 56
                      i32.const 0
                      i32.eq
                      set_local 1058
                      get_local 1058
                      if  ;; label = @10
                        i32.const 1
                        get_local 364
                        i32.shl
                        set_local 368
                        get_local 368
                        i32.const -1
                        i32.xor
                        set_local 369
                        get_local 226
                        get_local 369
                        i32.and
                        set_local 370
                        i32.const 1156
                        get_local 370
                        i32.store
                        get_local 370
                        set_local 454
                        br 3 (;@7;)
                      end
                    else
                      get_local 339
                      i32.const 16
                      i32.add
                      set_local 371
                      get_local 371
                      i32.load
                      set_local 372
                      get_local 372
                      get_local 57
                      i32.ne
                      set_local 373
                      get_local 373
                      i32.const 1
                      i32.and
                      set_local 84
                      get_local 339
                      i32.const 16
                      i32.add
                      get_local 84
                      i32.const 2
                      i32.shl
                      i32.add
                      set_local 375
                      get_local 375
                      get_local 56
                      i32.store
                      get_local 56
                      i32.const 0
                      i32.eq
                      set_local 376
                      get_local 376
                      if  ;; label = @10
                        get_local 226
                        set_local 454
                        br 3 (;@7;)
                      end
                    end
                    get_local 56
                    i32.const 24
                    i32.add
                    set_local 377
                    get_local 377
                    get_local 339
                    i32.store
                    get_local 57
                    i32.const 16
                    i32.add
                    set_local 378
                    get_local 378
                    i32.load
                    set_local 379
                    get_local 379
                    i32.const 0
                    i32.eq
                    set_local 380
                    get_local 380
                    i32.eqz
                    if  ;; label = @9
                      get_local 56
                      i32.const 16
                      i32.add
                      set_local 381
                      get_local 381
                      get_local 379
                      i32.store
                      get_local 379
                      i32.const 24
                      i32.add
                      set_local 382
                      get_local 382
                      get_local 56
                      i32.store
                    end
                    get_local 57
                    i32.const 20
                    i32.add
                    set_local 383
                    get_local 383
                    i32.load
                    set_local 384
                    get_local 384
                    i32.const 0
                    i32.eq
                    set_local 386
                    get_local 386
                    if  ;; label = @9
                      get_local 226
                      set_local 454
                    else
                      get_local 56
                      i32.const 20
                      i32.add
                      set_local 387
                      get_local 387
                      get_local 384
                      i32.store
                      get_local 384
                      i32.const 24
                      i32.add
                      set_local 388
                      get_local 388
                      get_local 56
                      i32.store
                      get_local 226
                      set_local 454
                    end
                  end
                end
                get_local 60
                i32.const 16
                i32.lt_u
                set_local 389
                block  ;; label = @7
                  get_local 389
                  if  ;; label = @8
                    get_local 60
                    get_local 225
                    i32.add
                    set_local 390
                    get_local 390
                    i32.const 3
                    i32.or
                    set_local 391
                    get_local 57
                    i32.const 4
                    i32.add
                    set_local 392
                    get_local 392
                    get_local 391
                    i32.store
                    get_local 57
                    get_local 390
                    i32.add
                    set_local 393
                    get_local 393
                    i32.const 4
                    i32.add
                    set_local 394
                    get_local 394
                    i32.load
                    set_local 395
                    get_local 395
                    i32.const 1
                    i32.or
                    set_local 397
                    get_local 394
                    get_local 397
                    i32.store
                  else
                    get_local 225
                    i32.const 3
                    i32.or
                    set_local 398
                    get_local 57
                    i32.const 4
                    i32.add
                    set_local 399
                    get_local 399
                    get_local 398
                    i32.store
                    get_local 60
                    i32.const 1
                    i32.or
                    set_local 400
                    get_local 336
                    i32.const 4
                    i32.add
                    set_local 401
                    get_local 401
                    get_local 400
                    i32.store
                    get_local 336
                    get_local 60
                    i32.add
                    set_local 402
                    get_local 402
                    get_local 60
                    i32.store
                    get_local 60
                    i32.const 3
                    i32.shr_u
                    set_local 403
                    get_local 60
                    i32.const 256
                    i32.lt_u
                    set_local 404
                    get_local 404
                    if  ;; label = @9
                      get_local 403
                      i32.const 1
                      i32.shl
                      set_local 405
                      i32.const 1192
                      get_local 405
                      i32.const 2
                      i32.shl
                      i32.add
                      set_local 406
                      i32.const 1152
                      i32.load
                      set_local 408
                      i32.const 1
                      get_local 403
                      i32.shl
                      set_local 409
                      get_local 408
                      get_local 409
                      i32.and
                      set_local 410
                      get_local 410
                      i32.const 0
                      i32.eq
                      set_local 411
                      get_local 411
                      if  ;; label = @10
                        get_local 408
                        get_local 409
                        i32.or
                        set_local 412
                        i32.const 1152
                        get_local 412
                        i32.store
                        get_local 406
                        i32.const 8
                        i32.add
                        set_local 73
                        get_local 406
                        set_local 37
                        get_local 73
                        set_local 76
                      else
                        get_local 406
                        i32.const 8
                        i32.add
                        set_local 413
                        get_local 413
                        i32.load
                        set_local 414
                        get_local 414
                        set_local 37
                        get_local 413
                        set_local 76
                      end
                      get_local 76
                      get_local 336
                      i32.store
                      get_local 37
                      i32.const 12
                      i32.add
                      set_local 415
                      get_local 415
                      get_local 336
                      i32.store
                      get_local 336
                      i32.const 8
                      i32.add
                      set_local 416
                      get_local 416
                      get_local 37
                      i32.store
                      get_local 336
                      i32.const 12
                      i32.add
                      set_local 417
                      get_local 417
                      get_local 406
                      i32.store
                      br 2 (;@7;)
                    end
                    get_local 60
                    i32.const 8
                    i32.shr_u
                    set_local 420
                    get_local 420
                    i32.const 0
                    i32.eq
                    set_local 421
                    get_local 421
                    if  ;; label = @9
                      i32.const 0
                      set_local 35
                    else
                      get_local 60
                      i32.const 16777215
                      i32.gt_u
                      set_local 422
                      get_local 422
                      if  ;; label = @10
                        i32.const 31
                        set_local 35
                      else
                        get_local 420
                        i32.const 1048320
                        i32.add
                        set_local 423
                        get_local 423
                        i32.const 16
                        i32.shr_u
                        set_local 424
                        get_local 424
                        i32.const 8
                        i32.and
                        set_local 425
                        get_local 420
                        get_local 425
                        i32.shl
                        set_local 426
                        get_local 426
                        i32.const 520192
                        i32.add
                        set_local 427
                        get_local 427
                        i32.const 16
                        i32.shr_u
                        set_local 428
                        get_local 428
                        i32.const 4
                        i32.and
                        set_local 429
                        get_local 429
                        get_local 425
                        i32.or
                        set_local 431
                        get_local 426
                        get_local 429
                        i32.shl
                        set_local 432
                        get_local 432
                        i32.const 245760
                        i32.add
                        set_local 433
                        get_local 433
                        i32.const 16
                        i32.shr_u
                        set_local 434
                        get_local 434
                        i32.const 2
                        i32.and
                        set_local 435
                        get_local 431
                        get_local 435
                        i32.or
                        set_local 436
                        i32.const 14
                        get_local 436
                        i32.sub
                        set_local 437
                        get_local 432
                        get_local 435
                        i32.shl
                        set_local 438
                        get_local 438
                        i32.const 15
                        i32.shr_u
                        set_local 439
                        get_local 437
                        get_local 439
                        i32.add
                        set_local 440
                        get_local 440
                        i32.const 1
                        i32.shl
                        set_local 442
                        get_local 440
                        i32.const 7
                        i32.add
                        set_local 443
                        get_local 60
                        get_local 443
                        i32.shr_u
                        set_local 444
                        get_local 444
                        i32.const 1
                        i32.and
                        set_local 445
                        get_local 445
                        get_local 442
                        i32.or
                        set_local 446
                        get_local 446
                        set_local 35
                      end
                    end
                    i32.const 1456
                    get_local 35
                    i32.const 2
                    i32.shl
                    i32.add
                    set_local 447
                    get_local 336
                    i32.const 28
                    i32.add
                    set_local 448
                    get_local 448
                    get_local 35
                    i32.store
                    get_local 336
                    i32.const 16
                    i32.add
                    set_local 449
                    get_local 449
                    i32.const 4
                    i32.add
                    set_local 450
                    get_local 450
                    i32.const 0
                    i32.store
                    get_local 449
                    i32.const 0
                    i32.store
                    i32.const 1
                    get_local 35
                    i32.shl
                    set_local 451
                    get_local 454
                    get_local 451
                    i32.and
                    set_local 453
                    get_local 453
                    i32.const 0
                    i32.eq
                    set_local 455
                    get_local 455
                    if  ;; label = @9
                      get_local 454
                      get_local 451
                      i32.or
                      set_local 456
                      i32.const 1156
                      get_local 456
                      i32.store
                      get_local 447
                      get_local 336
                      i32.store
                      get_local 336
                      i32.const 24
                      i32.add
                      set_local 457
                      get_local 457
                      get_local 447
                      i32.store
                      get_local 336
                      i32.const 12
                      i32.add
                      set_local 458
                      get_local 458
                      get_local 336
                      i32.store
                      get_local 336
                      i32.const 8
                      i32.add
                      set_local 459
                      get_local 459
                      get_local 336
                      i32.store
                      br 2 (;@7;)
                    end
                    get_local 447
                    i32.load
                    set_local 460
                    get_local 35
                    i32.const 31
                    i32.eq
                    set_local 461
                    get_local 35
                    i32.const 1
                    i32.shr_u
                    set_local 462
                    i32.const 25
                    get_local 462
                    i32.sub
                    set_local 464
                    get_local 461
                    if (result i32)  ;; label = @9
                      i32.const 0
                    else
                      get_local 464
                    end
                    set_local 465
                    get_local 60
                    get_local 465
                    i32.shl
                    set_local 466
                    get_local 466
                    set_local 28
                    get_local 460
                    set_local 29
                    loop  ;; label = @9
                      block  ;; label = @10
                        get_local 29
                        i32.const 4
                        i32.add
                        set_local 467
                        get_local 467
                        i32.load
                        set_local 468
                        get_local 468
                        i32.const -8
                        i32.and
                        set_local 469
                        get_local 469
                        get_local 60
                        i32.eq
                        set_local 470
                        get_local 470
                        if  ;; label = @11
                          i32.const 97
                          set_local 1074
                          br 1 (;@10;)
                        end
                        get_local 28
                        i32.const 31
                        i32.shr_u
                        set_local 471
                        get_local 29
                        i32.const 16
                        i32.add
                        get_local 471
                        i32.const 2
                        i32.shl
                        i32.add
                        set_local 472
                        get_local 28
                        i32.const 1
                        i32.shl
                        set_local 473
                        get_local 472
                        i32.load
                        set_local 475
                        get_local 475
                        i32.const 0
                        i32.eq
                        set_local 476
                        get_local 476
                        if  ;; label = @11
                          i32.const 96
                          set_local 1074
                          br 1 (;@10;)
                        else
                          get_local 473
                          set_local 28
                          get_local 475
                          set_local 29
                        end
                        br 1 (;@9;)
                      end
                    end
                    get_local 1074
                    i32.const 96
                    i32.eq
                    if  ;; label = @9
                      get_local 472
                      get_local 336
                      i32.store
                      get_local 336
                      i32.const 24
                      i32.add
                      set_local 477
                      get_local 477
                      get_local 29
                      i32.store
                      get_local 336
                      i32.const 12
                      i32.add
                      set_local 478
                      get_local 478
                      get_local 336
                      i32.store
                      get_local 336
                      i32.const 8
                      i32.add
                      set_local 479
                      get_local 479
                      get_local 336
                      i32.store
                      br 2 (;@7;)
                    else
                      get_local 1074
                      i32.const 97
                      i32.eq
                      if  ;; label = @10
                        get_local 29
                        i32.const 8
                        i32.add
                        set_local 480
                        get_local 480
                        i32.load
                        set_local 481
                        get_local 481
                        i32.const 12
                        i32.add
                        set_local 482
                        get_local 482
                        get_local 336
                        i32.store
                        get_local 480
                        get_local 336
                        i32.store
                        get_local 336
                        i32.const 8
                        i32.add
                        set_local 483
                        get_local 483
                        get_local 481
                        i32.store
                        get_local 336
                        i32.const 12
                        i32.add
                        set_local 484
                        get_local 484
                        get_local 29
                        i32.store
                        get_local 336
                        i32.const 24
                        i32.add
                        set_local 486
                        get_local 486
                        i32.const 0
                        i32.store
                        br 3 (;@7;)
                      end
                    end
                  end
                end
                get_local 57
                i32.const 8
                i32.add
                set_local 487
                get_local 487
                set_local 6
                get_local 1075
                set_global  $STACKTOP
                get_local 6
                return
              else
                get_local 225
                set_local 15
              end
            end
          end
        end
      end
    end
    i32.const 1160
    i32.load
    set_local 488
    get_local 488
    get_local 15
    i32.lt_u
    set_local 489
    get_local 489
    i32.eqz
    if  ;; label = @1
      get_local 488
      get_local 15
      i32.sub
      set_local 490
      i32.const 1172
      i32.load
      set_local 491
      get_local 490
      i32.const 15
      i32.gt_u
      set_local 492
      get_local 492
      if  ;; label = @2
        get_local 491
        get_local 15
        i32.add
        set_local 493
        i32.const 1172
        get_local 493
        i32.store
        i32.const 1160
        get_local 490
        i32.store
        get_local 490
        i32.const 1
        i32.or
        set_local 494
        get_local 493
        i32.const 4
        i32.add
        set_local 495
        get_local 495
        get_local 494
        i32.store
        get_local 491
        get_local 488
        i32.add
        set_local 497
        get_local 497
        get_local 490
        i32.store
        get_local 15
        i32.const 3
        i32.or
        set_local 498
        get_local 491
        i32.const 4
        i32.add
        set_local 499
        get_local 499
        get_local 498
        i32.store
      else
        i32.const 1160
        i32.const 0
        i32.store
        i32.const 1172
        i32.const 0
        i32.store
        get_local 488
        i32.const 3
        i32.or
        set_local 500
        get_local 491
        i32.const 4
        i32.add
        set_local 501
        get_local 501
        get_local 500
        i32.store
        get_local 491
        get_local 488
        i32.add
        set_local 502
        get_local 502
        i32.const 4
        i32.add
        set_local 503
        get_local 503
        i32.load
        set_local 504
        get_local 504
        i32.const 1
        i32.or
        set_local 505
        get_local 503
        get_local 505
        i32.store
      end
      get_local 491
      i32.const 8
      i32.add
      set_local 506
      get_local 506
      set_local 6
      get_local 1075
      set_global  $STACKTOP
      get_local 6
      return
    end
    i32.const 1164
    i32.load
    set_local 508
    get_local 508
    get_local 15
    i32.gt_u
    set_local 509
    get_local 509
    if  ;; label = @1
      get_local 508
      get_local 15
      i32.sub
      set_local 510
      i32.const 1164
      get_local 510
      i32.store
      i32.const 1176
      i32.load
      set_local 511
      get_local 511
      get_local 15
      i32.add
      set_local 512
      i32.const 1176
      get_local 512
      i32.store
      get_local 510
      i32.const 1
      i32.or
      set_local 513
      get_local 512
      i32.const 4
      i32.add
      set_local 514
      get_local 514
      get_local 513
      i32.store
      get_local 15
      i32.const 3
      i32.or
      set_local 515
      get_local 511
      i32.const 4
      i32.add
      set_local 516
      get_local 516
      get_local 515
      i32.store
      get_local 511
      i32.const 8
      i32.add
      set_local 517
      get_local 517
      set_local 6
      get_local 1075
      set_global  $STACKTOP
      get_local 6
      return
    end
    i32.const 1624
    i32.load
    set_local 519
    get_local 519
    i32.const 0
    i32.eq
    set_local 520
    get_local 520
    if  ;; label = @1
      i32.const 1632
      i32.const 4096
      i32.store
      i32.const 1628
      i32.const 4096
      i32.store
      i32.const 1636
      i32.const -1
      i32.store
      i32.const 1640
      i32.const -1
      i32.store
      i32.const 1644
      i32.const 0
      i32.store
      i32.const 1596
      i32.const 0
      i32.store
      get_local 85
      set_local 521
      get_local 521
      i32.const -16
      i32.and
      set_local 522
      get_local 522
      i32.const 1431655768
      i32.xor
      set_local 523
      i32.const 1624
      get_local 523
      i32.store
      i32.const 4096
      set_local 527
    else
      i32.const 1632
      i32.load
      set_local 72
      get_local 72
      set_local 527
    end
    get_local 15
    i32.const 48
    i32.add
    set_local 524
    get_local 15
    i32.const 47
    i32.add
    set_local 525
    get_local 527
    get_local 525
    i32.add
    set_local 526
    i32.const 0
    get_local 527
    i32.sub
    set_local 528
    get_local 526
    get_local 528
    i32.and
    set_local 531
    get_local 531
    get_local 15
    i32.gt_u
    set_local 532
    get_local 532
    i32.eqz
    if  ;; label = @1
      i32.const 0
      set_local 6
      get_local 1075
      set_global  $STACKTOP
      get_local 6
      return
    end
    i32.const 1592
    i32.load
    set_local 533
    get_local 533
    i32.const 0
    i32.eq
    set_local 534
    get_local 534
    i32.eqz
    if  ;; label = @1
      i32.const 1584
      i32.load
      set_local 535
      get_local 535
      get_local 531
      i32.add
      set_local 536
      get_local 536
      get_local 535
      i32.le_u
      set_local 537
      get_local 536
      get_local 533
      i32.gt_u
      set_local 538
      get_local 537
      get_local 538
      i32.or
      set_local 1063
      get_local 1063
      if  ;; label = @2
        i32.const 0
        set_local 6
        get_local 1075
        set_global  $STACKTOP
        get_local 6
        return
      end
    end
    i32.const 1596
    i32.load
    set_local 539
    get_local 539
    i32.const 4
    i32.and
    set_local 540
    get_local 540
    i32.const 0
    i32.eq
    set_local 542
    block  ;; label = @1
      get_local 542
      if  ;; label = @2
        i32.const 1176
        i32.load
        set_local 543
        get_local 543
        i32.const 0
        i32.eq
        set_local 544
        block  ;; label = @3
          get_local 544
          if  ;; label = @4
            i32.const 118
            set_local 1074
          else
            i32.const 1600
            set_local 10
            loop  ;; label = @5
              block  ;; label = @6
                get_local 10
                i32.load
                set_local 545
                get_local 545
                get_local 543
                i32.gt_u
                set_local 546
                get_local 546
                i32.eqz
                if  ;; label = @7
                  get_local 10
                  i32.const 4
                  i32.add
                  set_local 547
                  get_local 547
                  i32.load
                  set_local 548
                  get_local 545
                  get_local 548
                  i32.add
                  set_local 549
                  get_local 549
                  get_local 543
                  i32.gt_u
                  set_local 550
                  get_local 550
                  if  ;; label = @8
                    br 2 (;@6;)
                  end
                end
                get_local 10
                i32.const 8
                i32.add
                set_local 551
                get_local 551
                i32.load
                set_local 553
                get_local 553
                i32.const 0
                i32.eq
                set_local 554
                get_local 554
                if  ;; label = @7
                  i32.const 118
                  set_local 1074
                  br 4 (;@3;)
                else
                  get_local 553
                  set_local 10
                end
                br 1 (;@5;)
              end
            end
            get_local 526
            get_local 508
            i32.sub
            set_local 579
            get_local 579
            get_local 528
            i32.and
            set_local 580
            get_local 580
            i32.const 2147483647
            i32.lt_u
            set_local 581
            get_local 581
            if  ;; label = @5
              get_local 580
              call $sbrk
              set_local 582
              get_local 10
              i32.load
              set_local 583
              get_local 547
              i32.load
              set_local 584
              get_local 583
              get_local 584
              i32.add
              set_local 586
              get_local 582
              get_local 586
              i32.eq
              set_local 587
              get_local 587
              if  ;; label = @6
                get_local 582
                i32.const -1
                i32.eq
                set_local 588
                get_local 588
                if  ;; label = @7
                  get_local 580
                  set_local 48
                else
                  get_local 580
                  set_local 66
                  get_local 582
                  set_local 67
                  i32.const 135
                  set_local 1074
                  br 6 (;@1;)
                end
              else
                get_local 582
                set_local 49
                get_local 580
                set_local 50
                i32.const 126
                set_local 1074
              end
            else
              i32.const 0
              set_local 48
            end
          end
        end
        block  ;; label = @3
          get_local 1074
          i32.const 118
          i32.eq
          if  ;; label = @4
            i32.const 0
            call $sbrk
            set_local 555
            get_local 555
            i32.const -1
            i32.eq
            set_local 556
            get_local 556
            if  ;; label = @5
              i32.const 0
              set_local 48
            else
              get_local 555
              set_local 557
              i32.const 1628
              i32.load
              set_local 558
              get_local 558
              i32.const -1
              i32.add
              set_local 559
              get_local 559
              get_local 557
              i32.and
              set_local 560
              get_local 560
              i32.const 0
              i32.eq
              set_local 561
              get_local 559
              get_local 557
              i32.add
              set_local 562
              i32.const 0
              get_local 558
              i32.sub
              set_local 564
              get_local 562
              get_local 564
              i32.and
              set_local 565
              get_local 565
              get_local 557
              i32.sub
              set_local 566
              get_local 561
              if (result i32)  ;; label = @6
                i32.const 0
              else
                get_local 566
              end
              set_local 567
              get_local 567
              get_local 531
              i32.add
              set_local 5
              i32.const 1584
              i32.load
              set_local 568
              get_local 5
              get_local 568
              i32.add
              set_local 569
              get_local 5
              get_local 15
              i32.gt_u
              set_local 570
              get_local 5
              i32.const 2147483647
              i32.lt_u
              set_local 571
              get_local 570
              get_local 571
              i32.and
              set_local 1061
              get_local 1061
              if  ;; label = @6
                i32.const 1592
                i32.load
                set_local 572
                get_local 572
                i32.const 0
                i32.eq
                set_local 573
                get_local 573
                i32.eqz
                if  ;; label = @7
                  get_local 569
                  get_local 568
                  i32.le_u
                  set_local 575
                  get_local 569
                  get_local 572
                  i32.gt_u
                  set_local 576
                  get_local 575
                  get_local 576
                  i32.or
                  set_local 1069
                  get_local 1069
                  if  ;; label = @8
                    i32.const 0
                    set_local 48
                    br 5 (;@3;)
                  end
                end
                get_local 5
                call $sbrk
                set_local 577
                get_local 577
                get_local 555
                i32.eq
                set_local 578
                get_local 578
                if  ;; label = @7
                  get_local 5
                  set_local 66
                  get_local 555
                  set_local 67
                  i32.const 135
                  set_local 1074
                  br 6 (;@1;)
                else
                  get_local 577
                  set_local 49
                  get_local 5
                  set_local 50
                  i32.const 126
                  set_local 1074
                end
              else
                i32.const 0
                set_local 48
              end
            end
          end
        end
        block  ;; label = @3
          get_local 1074
          i32.const 126
          i32.eq
          if  ;; label = @4
            i32.const 0
            get_local 50
            i32.sub
            set_local 589
            get_local 49
            i32.const -1
            i32.ne
            set_local 590
            get_local 50
            i32.const 2147483647
            i32.lt_u
            set_local 591
            get_local 591
            get_local 590
            i32.and
            set_local 1073
            get_local 524
            get_local 50
            i32.gt_u
            set_local 592
            get_local 592
            get_local 1073
            i32.and
            set_local 1065
            get_local 1065
            i32.eqz
            if  ;; label = @5
              get_local 49
              i32.const -1
              i32.eq
              set_local 603
              get_local 603
              if  ;; label = @6
                i32.const 0
                set_local 48
                br 3 (;@3;)
              else
                get_local 50
                set_local 66
                get_local 49
                set_local 67
                i32.const 135
                set_local 1074
                br 5 (;@1;)
              end
              unreachable
            end
            i32.const 1632
            i32.load
            set_local 593
            get_local 525
            get_local 50
            i32.sub
            set_local 594
            get_local 594
            get_local 593
            i32.add
            set_local 595
            i32.const 0
            get_local 593
            i32.sub
            set_local 597
            get_local 595
            get_local 597
            i32.and
            set_local 598
            get_local 598
            i32.const 2147483647
            i32.lt_u
            set_local 599
            get_local 599
            i32.eqz
            if  ;; label = @5
              get_local 50
              set_local 66
              get_local 49
              set_local 67
              i32.const 135
              set_local 1074
              br 4 (;@1;)
            end
            get_local 598
            call $sbrk
            set_local 600
            get_local 600
            i32.const -1
            i32.eq
            set_local 601
            get_local 601
            if  ;; label = @5
              get_local 589
              call $sbrk
              drop
              i32.const 0
              set_local 48
              br 2 (;@3;)
            else
              get_local 598
              get_local 50
              i32.add
              set_local 602
              get_local 602
              set_local 66
              get_local 49
              set_local 67
              i32.const 135
              set_local 1074
              br 4 (;@1;)
            end
            unreachable
          end
        end
        i32.const 1596
        i32.load
        set_local 604
        get_local 604
        i32.const 4
        i32.or
        set_local 605
        i32.const 1596
        get_local 605
        i32.store
        get_local 48
        set_local 59
        i32.const 133
        set_local 1074
      else
        i32.const 0
        set_local 59
        i32.const 133
        set_local 1074
      end
    end
    get_local 1074
    i32.const 133
    i32.eq
    if  ;; label = @1
      get_local 531
      i32.const 2147483647
      i32.lt_u
      set_local 606
      get_local 606
      if  ;; label = @2
        get_local 531
        call $sbrk
        set_local 608
        i32.const 0
        call $sbrk 
        set_local 609
        get_local 608
        i32.const -1
        i32.ne
        set_local 610
        get_local 609
        i32.const -1
        i32.ne
        set_local 611
        get_local 610
        get_local 611
        i32.and
        set_local 1071
        get_local 608
        get_local 609
        i32.lt_u
        set_local 612
        get_local 612
        get_local 1071
        i32.and
        set_local 1066
        get_local 609
        set_local 613
        get_local 608
        set_local 614
        get_local 613
        get_local 614
        i32.sub
        set_local 615
        get_local 15
        i32.const 40
        i32.add
        set_local 616
        get_local 615
        get_local 616
        i32.gt_u
        set_local 617
        get_local 617
        if (result i32)  ;; label = @3
          get_local 615
        else
          get_local 59
        end
        set_local 3
        get_local 1066
        i32.const 1
        i32.xor
        set_local 1067
        get_local 608
        i32.const -1
        i32.eq
        set_local 619
        get_local 617
        i32.const 1
        i32.xor
        set_local 1059
        get_local 619
        get_local 1059
        i32.or
        set_local 620
        get_local 620
        get_local 1067
        i32.or
        set_local 1070
        get_local 1070
        i32.eqz
        if  ;; label = @3
          get_local 3
          set_local 66
          get_local 608
          set_local 67
          i32.const 135
          set_local 1074
        end
      end
    end
    get_local 1074
    i32.const 135
    i32.eq
    if  ;; label = @1
      i32.const 1584
      i32.load
      set_local 621
      get_local 621
      get_local 66
      i32.add
      set_local 622
      i32.const 1584
      get_local 622
      i32.store
      i32.const 1588
      i32.load
      set_local 623
      get_local 622
      get_local 623
      i32.gt_u
      set_local 624
      get_local 624
      if  ;; label = @2
        i32.const 1588
        get_local 622
        i32.store
      end
      i32.const 1176
      i32.load
      set_local 625
      get_local 625
      i32.const 0
      i32.eq
      set_local 626
      block  ;; label = @2
        get_local 626
        if  ;; label = @3
          i32.const 1168
          i32.load
          set_local 627
          get_local 627
          i32.const 0
          i32.eq
          set_local 628
          get_local 67
          get_local 627
          i32.lt_u
          set_local 630
          get_local 628
          get_local 630
          i32.or
          set_local 1068
          get_local 1068
          if  ;; label = @4
            i32.const 1168
            get_local 67
            i32.store
          end
          i32.const 1600
          get_local 67
          i32.store
          i32.const 1604
          get_local 66
          i32.store
          i32.const 1612
          i32.const 0
          i32.store
          i32.const 1624
          i32.load
          set_local 631
          i32.const 1188
          get_local 631
          i32.store
          i32.const 1184
          i32.const -1
          i32.store
          i32.const 1204
          i32.const 1192
          i32.store
          i32.const 1200
          i32.const 1192
          i32.store
          i32.const 1212
          i32.const 1200
          i32.store
          i32.const 1208
          i32.const 1200
          i32.store
          i32.const 1220
          i32.const 1208
          i32.store
          i32.const 1216
          i32.const 1208
          i32.store
          i32.const 1228
          i32.const 1216
          i32.store
          i32.const 1224
          i32.const 1216
          i32.store
          i32.const 1236
          i32.const 1224
          i32.store
          i32.const 1232
          i32.const 1224
          i32.store
          i32.const 1244
          i32.const 1232
          i32.store
          i32.const 1240
          i32.const 1232
          i32.store
          i32.const 1252
          i32.const 1240
          i32.store
          i32.const 1248
          i32.const 1240
          i32.store
          i32.const 1260
          i32.const 1248
          i32.store
          i32.const 1256
          i32.const 1248
          i32.store
          i32.const 1268
          i32.const 1256
          i32.store
          i32.const 1264
          i32.const 1256
          i32.store
          i32.const 1276
          i32.const 1264
          i32.store
          i32.const 1272
          i32.const 1264
          i32.store
          i32.const 1284
          i32.const 1272
          i32.store
          i32.const 1280
          i32.const 1272
          i32.store
          i32.const 1292
          i32.const 1280
          i32.store
          i32.const 1288
          i32.const 1280
          i32.store
          i32.const 1300
          i32.const 1288
          i32.store
          i32.const 1296
          i32.const 1288
          i32.store
          i32.const 1308
          i32.const 1296
          i32.store
          i32.const 1304
          i32.const 1296
          i32.store
          i32.const 1316
          i32.const 1304
          i32.store
          i32.const 1312
          i32.const 1304
          i32.store
          i32.const 1324
          i32.const 1312
          i32.store
          i32.const 1320
          i32.const 1312
          i32.store
          i32.const 1332
          i32.const 1320
          i32.store
          i32.const 1328
          i32.const 1320
          i32.store
          i32.const 1340
          i32.const 1328
          i32.store
          i32.const 1336
          i32.const 1328
          i32.store
          i32.const 1348
          i32.const 1336
          i32.store
          i32.const 1344
          i32.const 1336
          i32.store
          i32.const 1356
          i32.const 1344
          i32.store
          i32.const 1352
          i32.const 1344
          i32.store
          i32.const 1364
          i32.const 1352
          i32.store
          i32.const 1360
          i32.const 1352
          i32.store
          i32.const 1372
          i32.const 1360
          i32.store
          i32.const 1368
          i32.const 1360
          i32.store
          i32.const 1380
          i32.const 1368
          i32.store
          i32.const 1376
          i32.const 1368
          i32.store
          i32.const 1388
          i32.const 1376
          i32.store
          i32.const 1384
          i32.const 1376
          i32.store
          i32.const 1396
          i32.const 1384
          i32.store
          i32.const 1392
          i32.const 1384
          i32.store
          i32.const 1404
          i32.const 1392
          i32.store
          i32.const 1400
          i32.const 1392
          i32.store
          i32.const 1412
          i32.const 1400
          i32.store
          i32.const 1408
          i32.const 1400
          i32.store
          i32.const 1420
          i32.const 1408
          i32.store
          i32.const 1416
          i32.const 1408
          i32.store
          i32.const 1428
          i32.const 1416
          i32.store
          i32.const 1424
          i32.const 1416
          i32.store
          i32.const 1436
          i32.const 1424
          i32.store
          i32.const 1432
          i32.const 1424
          i32.store
          i32.const 1444
          i32.const 1432
          i32.store
          i32.const 1440
          i32.const 1432
          i32.store
          i32.const 1452
          i32.const 1440
          i32.store
          i32.const 1448
          i32.const 1440
          i32.store
          get_local 66
          i32.const -40
          i32.add
          set_local 632
          get_local 67
          i32.const 8
          i32.add
          set_local 633
          get_local 633
          set_local 634
          get_local 634
          i32.const 7
          i32.and
          set_local 635
          get_local 635
          i32.const 0
          i32.eq
          set_local 636
          i32.const 0
          get_local 634
          i32.sub
          set_local 637
          get_local 637
          i32.const 7
          i32.and
          set_local 638
          get_local 636
          if (result i32)  ;; label = @4
            i32.const 0
          else
            get_local 638
          end
          set_local 639
          get_local 67
          get_local 639
          i32.add
          set_local 642
          get_local 632
          get_local 639
          i32.sub
          set_local 643
          i32.const 1176
          get_local 642
          i32.store
          i32.const 1164
          get_local 643
          i32.store
          get_local 643
          i32.const 1
          i32.or
          set_local 644
          get_local 642
          i32.const 4
          i32.add
          set_local 645
          get_local 645
          get_local 644
          i32.store
          get_local 67
          get_local 632
          i32.add
          set_local 646
          get_local 646
          i32.const 4
          i32.add
          set_local 647
          get_local 647
          i32.const 40
          i32.store
          i32.const 1640
          i32.load
          set_local 648
          i32.const 1180
          get_local 648
          i32.store
        else
          i32.const 1600
          set_local 21
          loop  ;; label = @4
            block  ;; label = @5
              get_local 21
              i32.load
              set_local 649
              get_local 21
              i32.const 4
              i32.add
              set_local 650
              get_local 650
              i32.load
              set_local 651
              get_local 649
              get_local 651
              i32.add
              set_local 653
              get_local 67
              get_local 653
              i32.eq
              set_local 654
              get_local 654
              if  ;; label = @6
                i32.const 143
                set_local 1074
                br 1 (;@5;)
              end
              get_local 21
              i32.const 8
              i32.add
              set_local 655
              get_local 655
              i32.load
              set_local 656
              get_local 656
              i32.const 0
              i32.eq
              set_local 657
              get_local 657
              if  ;; label = @6
                br 1 (;@5;)
              else
                get_local 656
                set_local 21
              end
              br 1 (;@4;)
            end
          end
          get_local 1074
          i32.const 143
          i32.eq
          if  ;; label = @4
            get_local 21
            i32.const 12
            i32.add
            set_local 658
            get_local 658
            i32.load
            set_local 659
            get_local 659
            i32.const 8
            i32.and
            set_local 660
            get_local 660
            i32.const 0
            i32.eq
            set_local 661
            get_local 661
            if  ;; label = @5
              get_local 649
              get_local 625
              i32.le_u
              set_local 662
              get_local 67
              get_local 625
              i32.gt_u
              set_local 664
              get_local 664
              get_local 662
              i32.and
              set_local 1072
              get_local 1072
              if  ;; label = @6
                get_local 651
                get_local 66
                i32.add
                set_local 665
                get_local 650
                get_local 665
                i32.store
                i32.const 1164
                i32.load
                set_local 666
                get_local 666
                get_local 66
                i32.add
                set_local 667
                get_local 625
                i32.const 8
                i32.add
                set_local 668
                get_local 668
                set_local 669
                get_local 669
                i32.const 7
                i32.and
                set_local 670
                get_local 670
                i32.const 0
                i32.eq
                set_local 671
                i32.const 0
                get_local 669
                i32.sub
                set_local 672
                get_local 672
                i32.const 7
                i32.and
                set_local 673
                get_local 671
                if (result i32)  ;; label = @7
                  i32.const 0
                else
                  get_local 673
                end
                set_local 675
                get_local 625
                get_local 675
                i32.add
                set_local 676
                get_local 667
                get_local 675
                i32.sub
                set_local 677
                i32.const 1176
                get_local 676
                i32.store
                i32.const 1164
                get_local 677
                i32.store
                get_local 677
                i32.const 1
                i32.or
                set_local 678
                get_local 676
                i32.const 4
                i32.add
                set_local 679
                get_local 679
                get_local 678
                i32.store
                get_local 625
                get_local 667
                i32.add
                set_local 680
                get_local 680
                i32.const 4
                i32.add
                set_local 681
                get_local 681
                i32.const 40
                i32.store
                i32.const 1640
                i32.load
                set_local 682
                i32.const 1180
                get_local 682
                i32.store
                br 4 (;@2;)
              end
            end
          end
          i32.const 1168
          i32.load
          set_local 683
          get_local 67
          get_local 683
          i32.lt_u
          set_local 684
          get_local 684
          if  ;; label = @4
            i32.const 1168
            get_local 67
            i32.store
          end
          get_local 67
          get_local 66
          i32.add
          set_local 686
          i32.const 1600
          set_local 40
          loop  ;; label = @4
            block  ;; label = @5
              get_local 40
              i32.load
              set_local 687
              get_local 687
              get_local 686
              i32.eq
              set_local 688
              get_local 688
              if  ;; label = @6
                i32.const 151
                set_local 1074
                br 1 (;@5;)
              end
              get_local 40
              i32.const 8
              i32.add
              set_local 689
              get_local 689
              i32.load
              set_local 690
              get_local 690
              i32.const 0
              i32.eq
              set_local 691
              get_local 691
              if  ;; label = @6
                i32.const 1600
                set_local 9
                br 1 (;@5;)
              else
                get_local 690
                set_local 40
              end
              br 1 (;@4;)
            end
          end
          get_local 1074
          i32.const 151
          i32.eq
          if  ;; label = @4
            get_local 40
            i32.const 12
            i32.add
            set_local 692
            get_local 692
            i32.load
            set_local 693
            get_local 693
            i32.const 8
            i32.and
            set_local 694
            get_local 694
            i32.const 0
            i32.eq
            set_local 695
            get_local 695
            if  ;; label = @5
              get_local 40
              get_local 67
              i32.store
              get_local 40
              i32.const 4
              i32.add
              set_local 697
              get_local 697
              i32.load
              set_local 698
              get_local 698
              get_local 66
              i32.add
              set_local 699
              get_local 697
              get_local 699
              i32.store
              get_local 67
              i32.const 8
              i32.add
              set_local 700
              get_local 700
              set_local 701
              get_local 701
              i32.const 7
              i32.and
              set_local 702
              get_local 702
              i32.const 0
              i32.eq
              set_local 703
              i32.const 0
              get_local 701
              i32.sub
              set_local 704
              get_local 704
              i32.const 7
              i32.and
              set_local 705
              get_local 703
              if (result i32)  ;; label = @6
                i32.const 0
              else
                get_local 705
              end
              set_local 706
              get_local 67
              get_local 706
              i32.add
              set_local 708
              get_local 686
              i32.const 8
              i32.add
              set_local 709
              get_local 709
              set_local 710
              get_local 710
              i32.const 7
              i32.and
              set_local 711
              get_local 711
              i32.const 0
              i32.eq
              set_local 712
              i32.const 0
              get_local 710
              i32.sub
              set_local 713
              get_local 713
              i32.const 7
              i32.and
              set_local 714
              get_local 712
              if (result i32)  ;; label = @6
                i32.const 0
              else
                get_local 714
              end
              set_local 715
              get_local 686
              get_local 715
              i32.add
              set_local 716
              get_local 716
              set_local 717
              get_local 708
              set_local 719
              get_local 717
              get_local 719
              i32.sub
              set_local 720
              get_local 708
              get_local 15
              i32.add
              set_local 721
              get_local 720
              get_local 15
              i32.sub
              set_local 722
              get_local 15
              i32.const 3
              i32.or
              set_local 723
              get_local 708
              i32.const 4
              i32.add
              set_local 724
              get_local 724
              get_local 723
              i32.store
              get_local 625
              get_local 716
              i32.eq
              set_local 725
              block  ;; label = @6
                get_local 725
                if  ;; label = @7
                  i32.const 1164
                  i32.load
                  set_local 726
                  get_local 726
                  get_local 722
                  i32.add
                  set_local 727
                  i32.const 1164
                  get_local 727
                  i32.store
                  i32.const 1176
                  get_local 721
                  i32.store
                  get_local 727
                  i32.const 1
                  i32.or
                  set_local 728
                  get_local 721
                  i32.const 4
                  i32.add
                  set_local 730
                  get_local 730
                  get_local 728
                  i32.store
                else
                  i32.const 1172
                  i32.load
                  set_local 731
                  get_local 731
                  get_local 716
                  i32.eq
                  set_local 732
                  get_local 732
                  if  ;; label = @8
                    i32.const 1160
                    i32.load
                    set_local 733
                    get_local 733
                    get_local 722
                    i32.add
                    set_local 734
                    i32.const 1160
                    get_local 734
                    i32.store
                    i32.const 1172
                    get_local 721
                    i32.store
                    get_local 734
                    i32.const 1
                    i32.or
                    set_local 735
                    get_local 721
                    i32.const 4
                    i32.add
                    set_local 736
                    get_local 736
                    get_local 735
                    i32.store
                    get_local 721
                    get_local 734
                    i32.add
                    set_local 737
                    get_local 737
                    get_local 734
                    i32.store
                    br 2 (;@6;)
                  end
                  get_local 716
                  i32.const 4
                  i32.add
                  set_local 738
                  get_local 738
                  i32.load
                  set_local 739
                  get_local 739
                  i32.const 3
                  i32.and
                  set_local 741
                  get_local 741
                  i32.const 1
                  i32.eq
                  set_local 742
                  get_local 742
                  if  ;; label = @8
                    get_local 739
                    i32.const -8
                    i32.and
                    set_local 743
                    get_local 739
                    i32.const 3
                    i32.shr_u
                    set_local 744
                    get_local 739
                    i32.const 256
                    i32.lt_u
                    set_local 745
                    block  ;; label = @9
                      get_local 745
                      if  ;; label = @10
                        get_local 716
                        i32.const 8
                        i32.add
                        set_local 746
                        get_local 746
                        i32.load
                        set_local 747
                        get_local 716
                        i32.const 12
                        i32.add
                        set_local 748
                        get_local 748
                        i32.load
                        set_local 749
                        get_local 749
                        get_local 747
                        i32.eq
                        set_local 750
                        get_local 750
                        if  ;; label = @11
                          i32.const 1
                          get_local 744
                          i32.shl
                          set_local 753
                          get_local 753
                          i32.const -1
                          i32.xor
                          set_local 754
                          i32.const 1152
                          i32.load
                          set_local 755
                          get_local 755
                          get_local 754
                          i32.and
                          set_local 756
                          i32.const 1152
                          get_local 756
                          i32.store
                          br 2 (;@9;)
                        else
                          get_local 747
                          i32.const 12
                          i32.add
                          set_local 757
                          get_local 757
                          get_local 749
                          i32.store
                          get_local 749
                          i32.const 8
                          i32.add
                          set_local 758
                          get_local 758
                          get_local 747
                          i32.store
                          br 2 (;@9;)
                        end
                        unreachable
                      else
                        get_local 716
                        i32.const 24
                        i32.add
                        set_local 759
                        get_local 759
                        i32.load
                        set_local 760
                        get_local 716
                        i32.const 12
                        i32.add
                        set_local 761
                        get_local 761
                        i32.load
                        set_local 762
                        get_local 762
                        get_local 716
                        i32.eq
                        set_local 764
                        block  ;; label = @11
                          get_local 764
                          if  ;; label = @12
                            get_local 716
                            i32.const 16
                            i32.add
                            set_local 769
                            get_local 769
                            i32.const 4
                            i32.add
                            set_local 770
                            get_local 770
                            i32.load
                            set_local 771
                            get_local 771
                            i32.const 0
                            i32.eq
                            set_local 772
                            get_local 772
                            if  ;; label = @13
                              get_local 769
                              i32.load
                              set_local 773
                              get_local 773
                              i32.const 0
                              i32.eq
                              set_local 775
                              get_local 775
                              if  ;; label = @14
                                i32.const 0
                                set_local 53
                                br 3 (;@11;)
                              else
                                get_local 773
                                set_local 41
                                get_local 769
                                set_local 42
                              end
                            else
                              get_local 771
                              set_local 41
                              get_local 770
                              set_local 42
                            end
                            loop  ;; label = @13
                              block  ;; label = @14
                                get_local 41
                                i32.const 20
                                i32.add
                                set_local 776
                                get_local 776
                                i32.load
                                set_local 777
                                get_local 777
                                i32.const 0
                                i32.eq
                                set_local 778
                                get_local 778
                                i32.eqz
                                if  ;; label = @15
                                  get_local 777
                                  set_local 41
                                  get_local 776
                                  set_local 42
                                  br 2 (;@13;)
                                end
                                get_local 41
                                i32.const 16
                                i32.add
                                set_local 779
                                get_local 779
                                i32.load
                                set_local 780
                                get_local 780
                                i32.const 0
                                i32.eq
                                set_local 781
                                get_local 781
                                if  ;; label = @15
                                  br 1 (;@14;)
                                else
                                  get_local 780
                                  set_local 41
                                  get_local 779
                                  set_local 42
                                end
                                br 1 (;@13;)
                              end
                            end
                            get_local 42
                            i32.const 0
                            i32.store
                            get_local 41
                            set_local 53
                          else
                            get_local 716
                            i32.const 8
                            i32.add
                            set_local 765
                            get_local 765
                            i32.load
                            set_local 766
                            get_local 766
                            i32.const 12
                            i32.add
                            set_local 767
                            get_local 767
                            get_local 762
                            i32.store
                            get_local 762
                            i32.const 8
                            i32.add
                            set_local 768
                            get_local 768
                            get_local 766
                            i32.store
                            get_local 762
                            set_local 53
                          end
                        end
                        get_local 760
                        i32.const 0
                        i32.eq
                        set_local 782
                        get_local 782
                        if  ;; label = @11
                          br 2 (;@9;)
                        end
                        get_local 716
                        i32.const 28
                        i32.add
                        set_local 783
                        get_local 783
                        i32.load
                        set_local 784
                        i32.const 1456
                        get_local 784
                        i32.const 2
                        i32.shl
                        i32.add
                        set_local 786
                        get_local 786
                        i32.load
                        set_local 787
                        get_local 787
                        get_local 716
                        i32.eq
                        set_local 788
                        block  ;; label = @11
                          get_local 788
                          if  ;; label = @12
                            get_local 786
                            get_local 53
                            i32.store
                            get_local 53
                            i32.const 0
                            i32.eq
                            set_local 1057
                            get_local 1057
                            i32.eqz
                            if  ;; label = @13
                              br 2 (;@11;)
                            end
                            i32.const 1
                            get_local 784
                            i32.shl
                            set_local 789
                            get_local 789
                            i32.const -1
                            i32.xor
                            set_local 790
                            i32.const 1156
                            i32.load
                            set_local 791
                            get_local 791
                            get_local 790
                            i32.and
                            set_local 792
                            i32.const 1156
                            get_local 792
                            i32.store
                            br 3 (;@9;)
                          else
                            get_local 760
                            i32.const 16
                            i32.add
                            set_local 793
                            get_local 793
                            i32.load
                            set_local 794
                            get_local 794
                            get_local 716
                            i32.ne
                            set_local 795
                            get_local 795
                            i32.const 1
                            i32.and
                            set_local 80
                            get_local 760
                            i32.const 16
                            i32.add
                            get_local 80
                            i32.const 2
                            i32.shl
                            i32.add
                            set_local 797
                            get_local 797
                            get_local 53
                            i32.store
                            get_local 53
                            i32.const 0
                            i32.eq
                            set_local 798
                            get_local 798
                            if  ;; label = @13
                              br 4 (;@9;)
                            end
                          end
                        end
                        get_local 53
                        i32.const 24
                        i32.add
                        set_local 799
                        get_local 799
                        get_local 760
                        i32.store
                        get_local 716
                        i32.const 16
                        i32.add
                        set_local 800
                        get_local 800
                        i32.load
                        set_local 801
                        get_local 801
                        i32.const 0
                        i32.eq
                        set_local 802
                        get_local 802
                        i32.eqz
                        if  ;; label = @11
                          get_local 53
                          i32.const 16
                          i32.add
                          set_local 803
                          get_local 803
                          get_local 801
                          i32.store
                          get_local 801
                          i32.const 24
                          i32.add
                          set_local 804
                          get_local 804
                          get_local 53
                          i32.store
                        end
                        get_local 800
                        i32.const 4
                        i32.add
                        set_local 805
                        get_local 805
                        i32.load
                        set_local 806
                        get_local 806
                        i32.const 0
                        i32.eq
                        set_local 808
                        get_local 808
                        if  ;; label = @11
                          br 2 (;@9;)
                        end
                        get_local 53
                        i32.const 20
                        i32.add
                        set_local 809
                        get_local 809
                        get_local 806
                        i32.store
                        get_local 806
                        i32.const 24
                        i32.add
                        set_local 810
                        get_local 810
                        get_local 53
                        i32.store
                      end
                    end
                    get_local 716
                    get_local 743
                    i32.add
                    set_local 811
                    get_local 743
                    get_local 722
                    i32.add
                    set_local 812
                    get_local 811
                    set_local 8
                    get_local 812
                    set_local 22
                  else
                    get_local 716
                    set_local 8
                    get_local 722
                    set_local 22
                  end
                  get_local 8
                  i32.const 4
                  i32.add
                  set_local 813
                  get_local 813
                  i32.load
                  set_local 814
                  get_local 814
                  i32.const -2
                  i32.and
                  set_local 815
                  get_local 813
                  get_local 815
                  i32.store
                  get_local 22
                  i32.const 1
                  i32.or
                  set_local 816
                  get_local 721
                  i32.const 4
                  i32.add
                  set_local 817
                  get_local 817
                  get_local 816
                  i32.store
                  get_local 721
                  get_local 22
                  i32.add
                  set_local 819
                  get_local 819
                  get_local 22
                  i32.store
                  get_local 22
                  i32.const 3
                  i32.shr_u
                  set_local 820
                  get_local 22
                  i32.const 256
                  i32.lt_u
                  set_local 821
                  get_local 821
                  if  ;; label = @8
                    get_local 820
                    i32.const 1
                    i32.shl
                    set_local 822
                    i32.const 1192
                    get_local 822
                    i32.const 2
                    i32.shl
                    i32.add
                    set_local 823
                    i32.const 1152
                    i32.load
                    set_local 824
                    i32.const 1
                    get_local 820
                    i32.shl
                    set_local 825
                    get_local 824
                    get_local 825
                    i32.and
                    set_local 826
                    get_local 826
                    i32.const 0
                    i32.eq
                    set_local 827
                    get_local 827
                    if  ;; label = @9
                      get_local 824
                      get_local 825
                      i32.or
                      set_local 828
                      i32.const 1152
                      get_local 828
                      i32.store
                      get_local 823
                      i32.const 8
                      i32.add
                      set_local 71
                      get_local 823
                      set_local 25
                      get_local 71
                      set_local 75
                    else
                      get_local 823
                      i32.const 8
                      i32.add
                      set_local 830
                      get_local 830
                      i32.load
                      set_local 831
                      get_local 831
                      set_local 25
                      get_local 830
                      set_local 75
                    end
                    get_local 75
                    get_local 721
                    i32.store
                    get_local 25
                    i32.const 12
                    i32.add
                    set_local 832
                    get_local 832
                    get_local 721
                    i32.store
                    get_local 721
                    i32.const 8
                    i32.add
                    set_local 833
                    get_local 833
                    get_local 25
                    i32.store
                    get_local 721
                    i32.const 12
                    i32.add
                    set_local 834
                    get_local 834
                    get_local 823
                    i32.store
                    br 2 (;@6;)
                  end
                  get_local 22
                  i32.const 8
                  i32.shr_u
                  set_local 835
                  get_local 835
                  i32.const 0
                  i32.eq
                  set_local 836
                  block  ;; label = @8
                    get_local 836
                    if  ;; label = @9
                      i32.const 0
                      set_local 26
                    else
                      get_local 22
                      i32.const 16777215
                      i32.gt_u
                      set_local 837
                      get_local 837
                      if  ;; label = @10
                        i32.const 31
                        set_local 26
                        br 2 (;@8;)
                      end
                      get_local 835
                      i32.const 1048320
                      i32.add
                      set_local 838
                      get_local 838
                      i32.const 16
                      i32.shr_u
                      set_local 839
                      get_local 839
                      i32.const 8
                      i32.and
                      set_local 841
                      get_local 835
                      get_local 841
                      i32.shl
                      set_local 842
                      get_local 842
                      i32.const 520192
                      i32.add
                      set_local 843
                      get_local 843
                      i32.const 16
                      i32.shr_u
                      set_local 844
                      get_local 844
                      i32.const 4
                      i32.and
                      set_local 845
                      get_local 845
                      get_local 841
                      i32.or
                      set_local 846
                      get_local 842
                      get_local 845
                      i32.shl
                      set_local 847
                      get_local 847
                      i32.const 245760
                      i32.add
                      set_local 848
                      get_local 848
                      i32.const 16
                      i32.shr_u
                      set_local 849
                      get_local 849
                      i32.const 2
                      i32.and
                      set_local 850
                      get_local 846
                      get_local 850
                      i32.or
                      set_local 852
                      i32.const 14
                      get_local 852
                      i32.sub
                      set_local 853
                      get_local 847
                      get_local 850
                      i32.shl
                      set_local 854
                      get_local 854
                      i32.const 15
                      i32.shr_u
                      set_local 855
                      get_local 853
                      get_local 855
                      i32.add
                      set_local 856
                      get_local 856
                      i32.const 1
                      i32.shl
                      set_local 857
                      get_local 856
                      i32.const 7
                      i32.add
                      set_local 858
                      get_local 22
                      get_local 858
                      i32.shr_u
                      set_local 859
                      get_local 859
                      i32.const 1
                      i32.and
                      set_local 860
                      get_local 860
                      get_local 857
                      i32.or
                      set_local 861
                      get_local 861
                      set_local 26
                    end
                  end
                  i32.const 1456
                  get_local 26
                  i32.const 2
                  i32.shl
                  i32.add
                  set_local 864
                  get_local 721
                  i32.const 28
                  i32.add
                  set_local 865
                  get_local 865
                  get_local 26
                  i32.store
                  get_local 721
                  i32.const 16
                  i32.add
                  set_local 866
                  get_local 866
                  i32.const 4
                  i32.add
                  set_local 867
                  get_local 867
                  i32.const 0
                  i32.store
                  get_local 866
                  i32.const 0
                  i32.store
                  i32.const 1156
                  i32.load
                  set_local 868
                  i32.const 1
                  get_local 26
                  i32.shl
                  set_local 869
                  get_local 868
                  get_local 869
                  i32.and
                  set_local 870
                  get_local 870
                  i32.const 0
                  i32.eq
                  set_local 871
                  get_local 871
                  if  ;; label = @8
                    get_local 868
                    get_local 869
                    i32.or
                    set_local 872
                    i32.const 1156
                    get_local 872
                    i32.store
                    get_local 864
                    get_local 721
                    i32.store
                    get_local 721
                    i32.const 24
                    i32.add
                    set_local 873
                    get_local 873
                    get_local 864
                    i32.store
                    get_local 721
                    i32.const 12
                    i32.add
                    set_local 875
                    get_local 875
                    get_local 721
                    i32.store
                    get_local 721
                    i32.const 8
                    i32.add
                    set_local 876
                    get_local 876
                    get_local 721
                    i32.store
                    br 2 (;@6;)
                  end
                  get_local 864
                  i32.load
                  set_local 877
                  get_local 26
                  i32.const 31
                  i32.eq
                  set_local 878
                  get_local 26
                  i32.const 1
                  i32.shr_u
                  set_local 879
                  i32.const 25
                  get_local 879
                  i32.sub
                  set_local 880
                  get_local 878
                  if (result i32)  ;; label = @8
                    i32.const 0
                  else
                    get_local 880
                  end
                  set_local 881
                  get_local 22
                  get_local 881
                  i32.shl
                  set_local 882
                  get_local 882
                  set_local 23
                  get_local 877
                  set_local 24
                  loop  ;; label = @8
                    block  ;; label = @9
                      get_local 24
                      i32.const 4
                      i32.add
                      set_local 883
                      get_local 883
                      i32.load
                      set_local 884
                      get_local 884
                      i32.const -8
                      i32.and
                      set_local 886
                      get_local 886
                      get_local 22
                      i32.eq
                      set_local 887
                      get_local 887
                      if  ;; label = @10
                        i32.const 192
                        set_local 1074
                        br 1 (;@9;)
                      end
                      get_local 23
                      i32.const 31
                      i32.shr_u
                      set_local 888
                      get_local 24
                      i32.const 16
                      i32.add
                      get_local 888
                      i32.const 2
                      i32.shl
                      i32.add
                      set_local 889
                      get_local 23
                      i32.const 1
                      i32.shl
                      set_local 890
                      get_local 889
                      i32.load
                      set_local 891
                      get_local 891
                      i32.const 0
                      i32.eq
                      set_local 892
                      get_local 892
                      if  ;; label = @10
                        i32.const 191
                        set_local 1074
                        br 1 (;@9;)
                      else
                        get_local 890
                        set_local 23
                        get_local 891
                        set_local 24
                      end
                      br 1 (;@8;)
                    end
                  end
                  get_local 1074
                  i32.const 191
                  i32.eq
                  if  ;; label = @8
                    get_local 889
                    get_local 721
                    i32.store
                    get_local 721
                    i32.const 24
                    i32.add
                    set_local 893
                    get_local 893
                    get_local 24
                    i32.store
                    get_local 721
                    i32.const 12
                    i32.add
                    set_local 894
                    get_local 894
                    get_local 721
                    i32.store
                    get_local 721
                    i32.const 8
                    i32.add
                    set_local 895
                    get_local 895
                    get_local 721
                    i32.store
                    br 2 (;@6;)
                  else
                    get_local 1074
                    i32.const 192
                    i32.eq
                    if  ;; label = @9
                      get_local 24
                      i32.const 8
                      i32.add
                      set_local 897
                      get_local 897
                      i32.load
                      set_local 898
                      get_local 898
                      i32.const 12
                      i32.add
                      set_local 899
                      get_local 899
                      get_local 721
                      i32.store
                      get_local 897
                      get_local 721
                      i32.store
                      get_local 721
                      i32.const 8
                      i32.add
                      set_local 900
                      get_local 900
                      get_local 898
                      i32.store
                      get_local 721
                      i32.const 12
                      i32.add
                      set_local 901
                      get_local 901
                      get_local 24
                      i32.store
                      get_local 721
                      i32.const 24
                      i32.add
                      set_local 902
                      get_local 902
                      i32.const 0
                      i32.store
                      br 3 (;@6;)
                    end
                  end
                end
              end
              get_local 708
              i32.const 8
              i32.add
              set_local 1041
              get_local 1041
              set_local 6
              get_local 1075
              set_global  $STACKTOP
              get_local 6
              return
            else
              i32.const 1600
              set_local 9
            end
          end
          loop  ;; label = @4
            block  ;; label = @5
              get_local 9
              i32.load
              set_local 903
              get_local 903
              get_local 625
              i32.gt_u
              set_local 904
              get_local 904
              i32.eqz
              if  ;; label = @6
                get_local 9
                i32.const 4
                i32.add
                set_local 905
                get_local 905
                i32.load
                set_local 906
                get_local 903
                get_local 906
                i32.add
                set_local 908
                get_local 908
                get_local 625
                i32.gt_u
                set_local 909
                get_local 909
                if  ;; label = @7
                  br 2 (;@5;)
                end
              end
              get_local 9
              i32.const 8
              i32.add
              set_local 910
              get_local 910
              i32.load
              set_local 911
              get_local 911
              set_local 9
              br 1 (;@4;)
            end
          end
          get_local 908
          i32.const -47
          i32.add
          set_local 912
          get_local 912
          i32.const 8
          i32.add
          set_local 913
          get_local 913
          set_local 914
          get_local 914
          i32.const 7
          i32.and
          set_local 915
          get_local 915
          i32.const 0
          i32.eq
          set_local 916
          i32.const 0
          get_local 914
          i32.sub
          set_local 917
          get_local 917
          i32.const 7
          i32.and
          set_local 919
          get_local 916
          if (result i32)  ;; label = @4
            i32.const 0
          else
            get_local 919
          end
          set_local 920
          get_local 912
          get_local 920
          i32.add
          set_local 921
          get_local 625
          i32.const 16
          i32.add
          set_local 922
          get_local 921
          get_local 922
          i32.lt_u
          set_local 923
          get_local 923
          if (result i32)  ;; label = @4
            get_local 625
          else
            get_local 921
          end
          set_local 924
          get_local 924
          i32.const 8
          i32.add
          set_local 925
          get_local 924
          i32.const 24
          i32.add
          set_local 926
          get_local 66
          i32.const -40
          i32.add
          set_local 927
          get_local 67
          i32.const 8
          i32.add
          set_local 928
          get_local 928
          set_local 930
          get_local 930
          i32.const 7
          i32.and
          set_local 931
          get_local 931
          i32.const 0
          i32.eq
          set_local 932
          i32.const 0
          get_local 930
          i32.sub
          set_local 933
          get_local 933
          i32.const 7
          i32.and
          set_local 934
          get_local 932
          if (result i32)  ;; label = @4
            i32.const 0
          else
            get_local 934
          end
          set_local 935
          get_local 67
          get_local 935
          i32.add
          set_local 936
          get_local 927
          get_local 935
          i32.sub
          set_local 937
          i32.const 1176
          get_local 936
          i32.store
          i32.const 1164
          get_local 937
          i32.store
          get_local 937
          i32.const 1
          i32.or
          set_local 938
          get_local 936
          i32.const 4
          i32.add
          set_local 939
          get_local 939
          get_local 938
          i32.store
          get_local 67
          get_local 927
          i32.add
          set_local 941
          get_local 941
          i32.const 4
          i32.add
          set_local 942
          get_local 942
          i32.const 40
          i32.store
          i32.const 1640
          i32.load
          set_local 943
          i32.const 1180
          get_local 943
          i32.store
          get_local 924
          i32.const 4
          i32.add
          set_local 944
          get_local 944
          i32.const 27
          i32.store
          get_local 925
          i32.const 1600
          i64.load align=4
          i64.store align=4
          get_local 925
          i32.const 8
          i32.add
          i32.const 1600
          i32.const 8
          i32.add
          i64.load align=4
          i64.store align=4
          i32.const 1600
          get_local 67
          i32.store
          i32.const 1604
          get_local 66
          i32.store
          i32.const 1612
          i32.const 0
          i32.store
          i32.const 1608
          get_local 925
          i32.store
          get_local 926
          set_local 946
          loop  ;; label = @4
            block  ;; label = @5
              get_local 946
              i32.const 4
              i32.add
              set_local 945
              get_local 945
              i32.const 7
              i32.store
              get_local 946
              i32.const 8
              i32.add
              set_local 947
              get_local 947
              get_local 908
              i32.lt_u
              set_local 948
              get_local 948
              if  ;; label = @6
                get_local 945
                set_local 946
              else
                br 1 (;@5;)
              end
              br 1 (;@4;)
            end
          end
          get_local 924
          get_local 625
          i32.eq
          set_local 949
          get_local 949
          i32.eqz
          if  ;; label = @4
            get_local 924
            set_local 950
            get_local 625
            set_local 952
            get_local 950
            get_local 952
            i32.sub
            set_local 953
            get_local 944
            i32.load
            set_local 954
            get_local 954
            i32.const -2
            i32.and
            set_local 955
            get_local 944
            get_local 955
            i32.store
            get_local 953
            i32.const 1
            i32.or
            set_local 956
            get_local 625
            i32.const 4
            i32.add
            set_local 957
            get_local 957
            get_local 956
            i32.store
            get_local 924
            get_local 953
            i32.store
            get_local 953
            i32.const 3
            i32.shr_u
            set_local 958
            get_local 953
            i32.const 256
            i32.lt_u
            set_local 959
            get_local 959
            if  ;; label = @5
              get_local 958
              i32.const 1
              i32.shl
              set_local 960
              i32.const 1192
              get_local 960
              i32.const 2
              i32.shl
              i32.add
              set_local 961
              i32.const 1152
              i32.load
              set_local 963
              i32.const 1
              get_local 958
              i32.shl
              set_local 964
              get_local 963
              get_local 964
              i32.and
              set_local 965
              get_local 965
              i32.const 0
              i32.eq
              set_local 966
              get_local 966
              if  ;; label = @6
                get_local 963
                get_local 964
                i32.or
                set_local 967
                i32.const 1152
                get_local 967
                i32.store
                get_local 961
                i32.const 8
                i32.add
                set_local 70
                get_local 961
                set_local 19
                get_local 70
                set_local 74
              else
                get_local 961
                i32.const 8
                i32.add
                set_local 968
                get_local 968
                i32.load
                set_local 969
                get_local 969
                set_local 19
                get_local 968
                set_local 74
              end
              get_local 74
              get_local 625
              i32.store
              get_local 19
              i32.const 12
              i32.add
              set_local 970
              get_local 970
              get_local 625
              i32.store
              get_local 625
              i32.const 8
              i32.add
              set_local 971
              get_local 971
              get_local 19
              i32.store
              get_local 625
              i32.const 12
              i32.add
              set_local 972
              get_local 972
              get_local 961
              i32.store
              br 3 (;@2;)
            end
            get_local 953
            i32.const 8
            i32.shr_u
            set_local 975
            get_local 975
            i32.const 0
            i32.eq
            set_local 976
            get_local 976
            if  ;; label = @5
              i32.const 0
              set_local 20
            else
              get_local 953
              i32.const 16777215
              i32.gt_u
              set_local 977
              get_local 977
              if  ;; label = @6
                i32.const 31
                set_local 20
              else
                get_local 975
                i32.const 1048320
                i32.add
                set_local 978
                get_local 978
                i32.const 16
                i32.shr_u
                set_local 979
                get_local 979
                i32.const 8
                i32.and
                set_local 980
                get_local 975
                get_local 980
                i32.shl
                set_local 981
                get_local 981
                i32.const 520192
                i32.add
                set_local 982
                get_local 982
                i32.const 16
                i32.shr_u
                set_local 983
                get_local 983
                i32.const 4
                i32.and
                set_local 984
                get_local 984
                get_local 980
                i32.or
                set_local 986
                get_local 981
                get_local 984
                i32.shl
                set_local 987
                get_local 987
                i32.const 245760
                i32.add
                set_local 988
                get_local 988
                i32.const 16
                i32.shr_u
                set_local 989
                get_local 989
                i32.const 2
                i32.and
                set_local 990
                get_local 986
                get_local 990
                i32.or
                set_local 991
                i32.const 14
                get_local 991
                i32.sub
                set_local 992
                get_local 987
                get_local 990
                i32.shl
                set_local 993
                get_local 993
                i32.const 15
                i32.shr_u
                set_local 994
                get_local 992
                get_local 994
                i32.add
                set_local 995
                get_local 995
                i32.const 1
                i32.shl
                set_local 997
                get_local 995
                i32.const 7
                i32.add
                set_local 998
                get_local 953
                get_local 998
                i32.shr_u
                set_local 999
                get_local 999
                i32.const 1
                i32.and
                set_local 1000
                get_local 1000
                get_local 997
                i32.or
                set_local 1001
                get_local 1001
                set_local 20
              end
            end
            i32.const 1456
            get_local 20
            i32.const 2
            i32.shl
            i32.add
            set_local 1002
            get_local 625
            i32.const 28
            i32.add
            set_local 1003
            get_local 1003
            get_local 20
            i32.store
            get_local 625
            i32.const 20
            i32.add
            set_local 1004
            get_local 1004
            i32.const 0
            i32.store
            get_local 922
            i32.const 0
            i32.store
            i32.const 1156
            i32.load
            set_local 1005
            i32.const 1
            get_local 20
            i32.shl
            set_local 1006
            get_local 1005
            get_local 1006
            i32.and
            set_local 1008
            get_local 1008
            i32.const 0
            i32.eq
            set_local 1009
            get_local 1009
            if  ;; label = @5
              get_local 1005
              get_local 1006
              i32.or
              set_local 1010
              i32.const 1156
              get_local 1010
              i32.store
              get_local 1002
              get_local 625
              i32.store
              get_local 625
              i32.const 24
              i32.add
              set_local 1011
              get_local 1011
              get_local 1002
              i32.store
              get_local 625
              i32.const 12
              i32.add
              set_local 1012
              get_local 1012
              get_local 625
              i32.store
              get_local 625
              i32.const 8
              i32.add
              set_local 1013
              get_local 1013
              get_local 625
              i32.store
              br 3 (;@2;)
            end
            get_local 1002
            i32.load
            set_local 1014
            get_local 20
            i32.const 31
            i32.eq
            set_local 1015
            get_local 20
            i32.const 1
            i32.shr_u
            set_local 1016
            i32.const 25
            get_local 1016
            i32.sub
            set_local 1017
            get_local 1015
            if (result i32)  ;; label = @5
              i32.const 0
            else
              get_local 1017
            end
            set_local 1019
            get_local 953
            get_local 1019
            i32.shl
            set_local 1020
            get_local 1020
            set_local 17
            get_local 1014
            set_local 18
            loop  ;; label = @5
              block  ;; label = @6
                get_local 18
                i32.const 4
                i32.add
                set_local 1021
                get_local 1021
                i32.load
                set_local 1022
                get_local 1022
                i32.const -8
                i32.and
                set_local 1023
                get_local 1023
                get_local 953
                i32.eq
                set_local 1024
                get_local 1024
                if  ;; label = @7
                  i32.const 213
                  set_local 1074
                  br 1 (;@6;)
                end
                get_local 17
                i32.const 31
                i32.shr_u
                set_local 1025
                get_local 18
                i32.const 16
                i32.add
                get_local 1025
                i32.const 2
                i32.shl
                i32.add
                set_local 1026
                get_local 17
                i32.const 1
                i32.shl
                set_local 1027
                get_local 1026
                i32.load
                set_local 1028
                get_local 1028
                i32.const 0
                i32.eq
                set_local 1030
                get_local 1030
                if  ;; label = @7
                  i32.const 212
                  set_local 1074
                  br 1 (;@6;)
                else
                  get_local 1027
                  set_local 17
                  get_local 1028
                  set_local 18
                end
                br 1 (;@5;)
              end
            end
            get_local 1074
            i32.const 212
            i32.eq
            if  ;; label = @5
              get_local 1026
              get_local 625
              i32.store
              get_local 625
              i32.const 24
              i32.add
              set_local 1031
              get_local 1031
              get_local 18
              i32.store
              get_local 625
              i32.const 12
              i32.add
              set_local 1032
              get_local 1032
              get_local 625
              i32.store
              get_local 625
              i32.const 8
              i32.add
              set_local 1033
              get_local 1033
              get_local 625
              i32.store
              br 3 (;@2;)
            else
              get_local 1074
              i32.const 213
              i32.eq
              if  ;; label = @6
                get_local 18
                i32.const 8
                i32.add
                set_local 1034
                get_local 1034
                i32.load
                set_local 1035
                get_local 1035
                i32.const 12
                i32.add
                set_local 1036
                get_local 1036
                get_local 625
                i32.store
                get_local 1034
                get_local 625
                i32.store
                get_local 625
                i32.const 8
                i32.add
                set_local 1037
                get_local 1037
                get_local 1035
                i32.store
                get_local 625
                i32.const 12
                i32.add
                set_local 1038
                get_local 1038
                get_local 18
                i32.store
                get_local 625
                i32.const 24
                i32.add
                set_local 1039
                get_local 1039
                i32.const 0
                i32.store
                br 4 (;@2;)
              end
            end
          end
        end
      end
      i32.const 1164
      i32.load
      set_local 1042
      get_local 1042
      get_local 15
      i32.gt_u
      set_local 1043
      get_local 1043
      if  ;; label = @2
        get_local 1042
        get_local 15
        i32.sub
        set_local 1044
        i32.const 1164
        get_local 1044
        i32.store
        i32.const 1176
        i32.load
        set_local 1045
        get_local 1045
        get_local 15
        i32.add
        set_local 1046
        i32.const 1176
        get_local 1046
        i32.store
        get_local 1044
        i32.const 1
        i32.or
        set_local 1047
        get_local 1046
        i32.const 4
        i32.add
        set_local 1048
        get_local 1048
        get_local 1047
        i32.store
        get_local 15
        i32.const 3
        i32.or
        set_local 1049
        get_local 1045
        i32.const 4
        i32.add
        set_local 1050
        get_local 1050
        get_local 1049
        i32.store
        get_local 1045
        i32.const 8
        i32.add
        set_local 1052
        get_local 1052
        set_local 6
        get_local 1075
        set_global  $STACKTOP
        get_local 6
        return
      end
    end
    call $___errno_location
    set_local 1053
    get_local 1053
    i32.const 12
    i32.store
    i32.const 0
    set_local 6
    get_local 1075
    set_global  $STACKTOP
    get_local 6
    return)
    
    (func $free (type $3) (param i32)
        (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
        get_global  $STACKTOP
        set_local 283
        get_local 0
        i32.const 0
        i32.eq
        set_local 20
        get_local 20
        if  ;; label = @1
        return
        end
        get_local 0
        i32.const -8
        i32.add
        set_local 131
        i32.const 1168
        i32.load
        set_local 203
        get_local 0
        i32.const -4
        i32.add
        set_local 214
        get_local 214
        i32.load
        set_local 225
        get_local 225
        i32.const -8
        i32.and
        set_local 236
        get_local 131
        get_local 236
        i32.add
        set_local 247
        get_local 225
        i32.const 1
        i32.and
        set_local 258
        get_local 258
        i32.const 0
        i32.eq
        set_local 269
        block  ;; label = @1
        get_local 269
        if  ;; label = @2
            get_local 131
            i32.load
            set_local 21
            get_local 225
            i32.const 3
            i32.and
            set_local 32
            get_local 32
            i32.const 0
            i32.eq
            set_local 43
            get_local 43
            if  ;; label = @3
            return
            end
            i32.const 0
            get_local 21
            i32.sub
            set_local 54
            get_local 131
            get_local 54
            i32.add
            set_local 65
            get_local 21
            get_local 236
            i32.add
            set_local 76
            get_local 65
            get_local 203
            i32.lt_u
            set_local 87
            get_local 87
            if  ;; label = @3
            return
            end
            i32.const 1172
            i32.load
            set_local 98
            get_local 98
            get_local 65
            i32.eq
            set_local 109
            get_local 109
            if  ;; label = @3
            get_local 247
            i32.const 4
            i32.add
            set_local 257
            get_local 257
            i32.load
            set_local 259
            get_local 259
            i32.const 3
            i32.and
            set_local 260
            get_local 260
            i32.const 3
            i32.eq
            set_local 261
            get_local 261
            i32.eqz
            if  ;; label = @4
                get_local 65
                set_local 7
                get_local 76
                set_local 8
                get_local 65
                set_local 267
                br 3 (;@1;)
            end
            i32.const 1160
            get_local 76
            i32.store
            get_local 259
            i32.const -2
            i32.and
            set_local 262
            get_local 257
            get_local 262
            i32.store
            get_local 76
            i32.const 1
            i32.or
            set_local 263
            get_local 65
            i32.const 4
            i32.add
            set_local 264
            get_local 264
            get_local 263
            i32.store
            get_local 65
            get_local 76
            i32.add
            set_local 265
            get_local 265
            get_local 76
            i32.store
            return
            end
            get_local 21
            i32.const 3
            i32.shr_u
            set_local 120
            get_local 21
            i32.const 256
            i32.lt_u
            set_local 132
            get_local 132
            if  ;; label = @3
            get_local 65
            i32.const 8
            i32.add
            set_local 143
            get_local 143
            i32.load
            set_local 154
            get_local 65
            i32.const 12
            i32.add
            set_local 165
            get_local 165
            i32.load
            set_local 176
            get_local 176
            get_local 154
            i32.eq
            set_local 187
            get_local 187
            if  ;; label = @4
                i32.const 1
                get_local 120
                i32.shl
                set_local 198
                get_local 198
                i32.const -1
                i32.xor
                set_local 200
                i32.const 1152
                i32.load
                set_local 201
                get_local 201
                get_local 200
                i32.and
                set_local 202
                i32.const 1152
                get_local 202
                i32.store
                get_local 65
                set_local 7
                get_local 76
                set_local 8
                get_local 65
                set_local 267
                br 3 (;@1;)
            else
                get_local 154
                i32.const 12
                i32.add
                set_local 204
                get_local 204
                get_local 176
                i32.store
                get_local 176
                i32.const 8
                i32.add
                set_local 205
                get_local 205
                get_local 154
                i32.store
                get_local 65
                set_local 7
                get_local 76
                set_local 8
                get_local 65
                set_local 267
                br 3 (;@1;)
            end
            unreachable
            end
            get_local 65
            i32.const 24
            i32.add
            set_local 206
            get_local 206
            i32.load
            set_local 207
            get_local 65
            i32.const 12
            i32.add
            set_local 208
            get_local 208
            i32.load
            set_local 209
            get_local 209
            get_local 65
            i32.eq
            set_local 210
            block  ;; label = @3
            get_local 210
            if  ;; label = @4
                get_local 65
                i32.const 16
                i32.add
                set_local 216
                get_local 216
                i32.const 4
                i32.add
                set_local 217
                get_local 217
                i32.load
                set_local 218
                get_local 218
                i32.const 0
                i32.eq
                set_local 219
                get_local 219
                if  ;; label = @5
                get_local 216
                i32.load
                set_local 220
                get_local 220
                i32.const 0
                i32.eq
                set_local 221
                get_local 221
                if  ;; label = @6
                    i32.const 0
                    set_local 14
                    br 3 (;@3;)
                else
                    get_local 220
                    set_local 9
                    get_local 216
                    set_local 10
                end
                else
                get_local 218
                set_local 9
                get_local 217
                set_local 10
                end
                loop  ;; label = @5
                block  ;; label = @6
                    get_local 9
                    i32.const 20
                    i32.add
                    set_local 222
                    get_local 222
                    i32.load
                    set_local 223
                    get_local 223
                    i32.const 0
                    i32.eq
                    set_local 224
                    get_local 224
                    i32.eqz
                    if  ;; label = @7
                    get_local 223
                    set_local 9
                    get_local 222
                    set_local 10
                    br 2 (;@5;)
                    end
                    get_local 9
                    i32.const 16
                    i32.add
                    set_local 226
                    get_local 226
                    i32.load
                    set_local 227
                    get_local 227
                    i32.const 0
                    i32.eq
                    set_local 228
                    get_local 228
                    if  ;; label = @7
                    br 1 (;@6;)
                    else
                    get_local 227
                    set_local 9
                    get_local 226
                    set_local 10
                    end
                    br 1 (;@5;)
                end
                end
                get_local 10
                i32.const 0
                i32.store
                get_local 9
                set_local 14
            else
                get_local 65
                i32.const 8
                i32.add
                set_local 211
                get_local 211
                i32.load
                set_local 212
                get_local 212
                i32.const 12
                i32.add
                set_local 213
                get_local 213
                get_local 209
                i32.store
                get_local 209
                i32.const 8
                i32.add
                set_local 215
                get_local 215
                get_local 212
                i32.store
                get_local 209
                set_local 14
            end
            end
            get_local 207
            i32.const 0
            i32.eq
            set_local 229
            get_local 229
            if  ;; label = @3
            get_local 65
            set_local 7
            get_local 76
            set_local 8
            get_local 65
            set_local 267
            else
            get_local 65
            i32.const 28
            i32.add
            set_local 230
            get_local 230
            i32.load
            set_local 231
            i32.const 1456
            get_local 231
            i32.const 2
            i32.shl
            i32.add
            set_local 232
            get_local 232
            i32.load
            set_local 233
            get_local 233
            get_local 65
            i32.eq
            set_local 234
            get_local 234
            if  ;; label = @4
                get_local 232
                get_local 14
                i32.store
                get_local 14
                i32.const 0
                i32.eq
                set_local 280
                get_local 280
                if  ;; label = @5
                i32.const 1
                get_local 231
                i32.shl
                set_local 235
                get_local 235
                i32.const -1
                i32.xor
                set_local 237
                i32.const 1156
                i32.load
                set_local 238
                get_local 238
                get_local 237
                i32.and
                set_local 239
                i32.const 1156
                get_local 239
                i32.store
                get_local 65
                set_local 7
                get_local 76
                set_local 8
                get_local 65
                set_local 267
                br 4 (;@1;)
                end
            else
                get_local 207
                i32.const 16
                i32.add
                set_local 240
                get_local 240
                i32.load
                set_local 241
                get_local 241
                get_local 65
                i32.ne
                set_local 242
                get_local 242
                i32.const 1
                i32.and
                set_local 18
                get_local 207
                i32.const 16
                i32.add
                get_local 18
                i32.const 2
                i32.shl
                i32.add
                set_local 243
                get_local 243
                get_local 14
                i32.store
                get_local 14
                i32.const 0
                i32.eq
                set_local 244
                get_local 244
                if  ;; label = @5
                get_local 65
                set_local 7
                get_local 76
                set_local 8
                get_local 65
                set_local 267
                br 4 (;@1;)
                end
            end
            get_local 14
            i32.const 24
            i32.add
            set_local 245
            get_local 245
            get_local 207
            i32.store
            get_local 65
            i32.const 16
            i32.add
            set_local 246
            get_local 246
            i32.load
            set_local 248
            get_local 248
            i32.const 0
            i32.eq
            set_local 249
            get_local 249
            i32.eqz
            if  ;; label = @4
                get_local 14
                i32.const 16
                i32.add
                set_local 250
                get_local 250
                get_local 248
                i32.store
                get_local 248
                i32.const 24
                i32.add
                set_local 251
                get_local 251
                get_local 14
                i32.store
            end
            get_local 246
            i32.const 4
            i32.add
            set_local 252
            get_local 252
            i32.load
            set_local 253
            get_local 253
            i32.const 0
            i32.eq
            set_local 254
            get_local 254
            if  ;; label = @4
                get_local 65
                set_local 7
                get_local 76
                set_local 8
                get_local 65
                set_local 267
            else
                get_local 14
                i32.const 20
                i32.add
                set_local 255
                get_local 255
                get_local 253
                i32.store
                get_local 253
                i32.const 24
                i32.add
                set_local 256
                get_local 256
                get_local 14
                i32.store
                get_local 65
                set_local 7
                get_local 76
                set_local 8
                get_local 65
                set_local 267
            end
            end
        else
            get_local 131
            set_local 7
            get_local 236
            set_local 8
            get_local 131
            set_local 267
        end
        end
        get_local 267
        get_local 247
        i32.lt_u
        set_local 266
        get_local 266
        i32.eqz
        if  ;; label = @1
        return
        end
        get_local 247
        i32.const 4
        i32.add
        set_local 268
        get_local 268
        i32.load
        set_local 270
        get_local 270
        i32.const 1
        i32.and
        set_local 271
        get_local 271
        i32.const 0
        i32.eq
        set_local 272
        get_local 272
        if  ;; label = @1
        return
        end
        get_local 270
        i32.const 2
        i32.and
        set_local 273
        get_local 273
        i32.const 0
        i32.eq
        set_local 274
        get_local 274
        if  ;; label = @1
        i32.const 1176
        i32.load
        set_local 275
        get_local 275
        get_local 247
        i32.eq
        set_local 276
        get_local 276
        if  ;; label = @2
            i32.const 1164
            i32.load
            set_local 277
            get_local 277
            get_local 8
            i32.add
            set_local 278
            i32.const 1164
            get_local 278
            i32.store
            i32.const 1176
            get_local 7
            i32.store
            get_local 278
            i32.const 1
            i32.or
            set_local 279
            get_local 7
            i32.const 4
            i32.add
            set_local 22
            get_local 22
            get_local 279
            i32.store
            i32.const 1172
            i32.load
            set_local 23
            get_local 7
            get_local 23
            i32.eq
            set_local 24
            get_local 24
            i32.eqz
            if  ;; label = @3
            return
            end
            i32.const 1172
            i32.const 0
            i32.store
            i32.const 1160
            i32.const 0
            i32.store
            return
        end
        i32.const 1172
        i32.load
        set_local 25
        get_local 25
        get_local 247
        i32.eq
        set_local 26
        get_local 26
        if  ;; label = @2
            i32.const 1160
            i32.load
            set_local 27
            get_local 27
            get_local 8
            i32.add
            set_local 28
            i32.const 1160
            get_local 28
            i32.store
            i32.const 1172
            get_local 267
            i32.store
            get_local 28
            i32.const 1
            i32.or
            set_local 29
            get_local 7
            i32.const 4
            i32.add
            set_local 30
            get_local 30
            get_local 29
            i32.store
            get_local 267
            get_local 28
            i32.add
            set_local 31
            get_local 31
            get_local 28
            i32.store
            return
        end
        get_local 270
        i32.const -8
        i32.and
        set_local 33
        get_local 33
        get_local 8
        i32.add
        set_local 34
        get_local 270
        i32.const 3
        i32.shr_u
        set_local 35
        get_local 270
        i32.const 256
        i32.lt_u
        set_local 36
        block  ;; label = @2
            get_local 36
            if  ;; label = @3
            get_local 247
            i32.const 8
            i32.add
            set_local 37
            get_local 37
            i32.load
            set_local 38
            get_local 247
            i32.const 12
            i32.add
            set_local 39
            get_local 39
            i32.load
            set_local 40
            get_local 40
            get_local 38
            i32.eq
            set_local 41
            get_local 41
            if  ;; label = @4
                i32.const 1
                get_local 35
                i32.shl
                set_local 42
                get_local 42
                i32.const -1
                i32.xor
                set_local 44
                i32.const 1152
                i32.load
                set_local 45
                get_local 45
                get_local 44
                i32.and
                set_local 46
                i32.const 1152
                get_local 46
                i32.store
                br 2 (;@2;)
            else
                get_local 38
                i32.const 12
                i32.add
                set_local 47
                get_local 47
                get_local 40
                i32.store
                get_local 40
                i32.const 8
                i32.add
                set_local 48
                get_local 48
                get_local 38
                i32.store
                br 2 (;@2;)
            end
            unreachable
            else
            get_local 247
            i32.const 24
            i32.add
            set_local 49
            get_local 49
            i32.load
            set_local 50
            get_local 247
            i32.const 12
            i32.add
            set_local 51
            get_local 51
            i32.load
            set_local 52
            get_local 52
            get_local 247
            i32.eq
            set_local 53
            block  ;; label = @4
                get_local 53
                if  ;; label = @5
                get_local 247
                i32.const 16
                i32.add
                set_local 59
                get_local 59
                i32.const 4
                i32.add
                set_local 60
                get_local 60
                i32.load
                set_local 61
                get_local 61
                i32.const 0
                i32.eq
                set_local 62
                get_local 62
                if  ;; label = @6
                    get_local 59
                    i32.load
                    set_local 63
                    get_local 63
                    i32.const 0
                    i32.eq
                    set_local 64
                    get_local 64
                    if  ;; label = @7
                    i32.const 0
                    set_local 15
                    br 3 (;@4;)
                    else
                    get_local 63
                    set_local 11
                    get_local 59
                    set_local 12
                    end
                else
                    get_local 61
                    set_local 11
                    get_local 60
                    set_local 12
                end
                loop  ;; label = @6
                    block  ;; label = @7
                    get_local 11
                    i32.const 20
                    i32.add
                    set_local 66
                    get_local 66
                    i32.load
                    set_local 67
                    get_local 67
                    i32.const 0
                    i32.eq
                    set_local 68
                    get_local 68
                    i32.eqz
                    if  ;; label = @8
                        get_local 67
                        set_local 11
                        get_local 66
                        set_local 12
                        br 2 (;@6;)
                    end
                    get_local 11
                    i32.const 16
                    i32.add
                    set_local 69
                    get_local 69
                    i32.load
                    set_local 70
                    get_local 70
                    i32.const 0
                    i32.eq
                    set_local 71
                    get_local 71
                    if  ;; label = @8
                        br 1 (;@7;)
                    else
                        get_local 70
                        set_local 11
                        get_local 69
                        set_local 12
                    end
                    br 1 (;@6;)
                    end
                end
                get_local 12
                i32.const 0
                i32.store
                get_local 11
                set_local 15
                else
                get_local 247
                i32.const 8
                i32.add
                set_local 55
                get_local 55
                i32.load
                set_local 56
                get_local 56
                i32.const 12
                i32.add
                set_local 57
                get_local 57
                get_local 52
                i32.store
                get_local 52
                i32.const 8
                i32.add
                set_local 58
                get_local 58
                get_local 56
                i32.store
                get_local 52
                set_local 15
                end
            end
            get_local 50
            i32.const 0
            i32.eq
            set_local 72
            get_local 72
            i32.eqz
            if  ;; label = @4
                get_local 247
                i32.const 28
                i32.add
                set_local 73
                get_local 73
                i32.load
                set_local 74
                i32.const 1456
                get_local 74
                i32.const 2
                i32.shl
                i32.add
                set_local 75
                get_local 75
                i32.load
                set_local 77
                get_local 77
                get_local 247
                i32.eq
                set_local 78
                get_local 78
                if  ;; label = @5
                get_local 75
                get_local 15
                i32.store
                get_local 15
                i32.const 0
                i32.eq
                set_local 281
                get_local 281
                if  ;; label = @6
                    i32.const 1
                    get_local 74
                    i32.shl
                    set_local 79
                    get_local 79
                    i32.const -1
                    i32.xor
                    set_local 80
                    i32.const 1156
                    i32.load
                    set_local 81
                    get_local 81
                    get_local 80
                    i32.and
                    set_local 82
                    i32.const 1156
                    get_local 82
                    i32.store
                    br 4 (;@2;)
                end
                else
                get_local 50
                i32.const 16
                i32.add
                set_local 83
                get_local 83
                i32.load
                set_local 84
                get_local 84
                get_local 247
                i32.ne
                set_local 85
                get_local 85
                i32.const 1
                i32.and
                set_local 19
                get_local 50
                i32.const 16
                i32.add
                get_local 19
                i32.const 2
                i32.shl
                i32.add
                set_local 86
                get_local 86
                get_local 15
                i32.store
                get_local 15
                i32.const 0
                i32.eq
                set_local 88
                get_local 88
                if  ;; label = @6
                    br 4 (;@2;)
                end
                end
                get_local 15
                i32.const 24
                i32.add
                set_local 89
                get_local 89
                get_local 50
                i32.store
                get_local 247
                i32.const 16
                i32.add
                set_local 90
                get_local 90
                i32.load
                set_local 91
                get_local 91
                i32.const 0
                i32.eq
                set_local 92
                get_local 92
                i32.eqz
                if  ;; label = @5
                get_local 15
                i32.const 16
                i32.add
                set_local 93
                get_local 93
                get_local 91
                i32.store
                get_local 91
                i32.const 24
                i32.add
                set_local 94
                get_local 94
                get_local 15
                i32.store
                end
                get_local 90
                i32.const 4
                i32.add
                set_local 95
                get_local 95
                i32.load
                set_local 96
                get_local 96
                i32.const 0
                i32.eq
                set_local 97
                get_local 97
                i32.eqz
                if  ;; label = @5
                get_local 15
                i32.const 20
                i32.add
                set_local 99
                get_local 99
                get_local 96
                i32.store
                get_local 96
                i32.const 24
                i32.add
                set_local 100
                get_local 100
                get_local 15
                i32.store
                end
            end
            end
        end
        get_local 34
        i32.const 1
        i32.or
        set_local 101
        get_local 7
        i32.const 4
        i32.add
        set_local 102
        get_local 102
        get_local 101
        i32.store
        get_local 267
        get_local 34
        i32.add
        set_local 103
        get_local 103
        get_local 34
        i32.store
        i32.const 1172
        i32.load
        set_local 104
        get_local 7
        get_local 104
        i32.eq
        set_local 105
        get_local 105
        if  ;; label = @2
            i32.const 1160
            get_local 34
            i32.store
            return
        else
            get_local 34
            set_local 13
        end
        else
        get_local 270
        i32.const -2
        i32.and
        set_local 106
        get_local 268
        get_local 106
        i32.store
        get_local 8
        i32.const 1
        i32.or
        set_local 107
        get_local 7
        i32.const 4
        i32.add
        set_local 108
        get_local 108
        get_local 107
        i32.store
        get_local 267
        get_local 8
        i32.add
        set_local 110
        get_local 110
        get_local 8
        i32.store
        get_local 8
        set_local 13
        end
        get_local 13
        i32.const 3
        i32.shr_u
        set_local 111
        get_local 13
        i32.const 256
        i32.lt_u
        set_local 112
        get_local 112
        if  ;; label = @1
        get_local 111
        i32.const 1
        i32.shl
        set_local 113
        i32.const 1192
        get_local 113
        i32.const 2
        i32.shl
        i32.add
        set_local 114
        i32.const 1152
        i32.load
        set_local 115
        i32.const 1
        get_local 111
        i32.shl
        set_local 116
        get_local 115
        get_local 116
        i32.and
        set_local 117
        get_local 117
        i32.const 0
        i32.eq
        set_local 118
        get_local 118
        if  ;; label = @2
            get_local 115
            get_local 116
            i32.or
            set_local 119
            i32.const 1152
            get_local 119
            i32.store
            get_local 114
            i32.const 8
            i32.add
            set_local 16
            get_local 114
            set_local 6
            get_local 16
            set_local 17
        else
            get_local 114
            i32.const 8
            i32.add
            set_local 121
            get_local 121
            i32.load
            set_local 122
            get_local 122
            set_local 6
            get_local 121
            set_local 17
        end
        get_local 17
        get_local 7
        i32.store
        get_local 6
        i32.const 12
        i32.add
        set_local 123
        get_local 123
        get_local 7
        i32.store
        get_local 7
        i32.const 8
        i32.add
        set_local 124
        get_local 124
        get_local 6
        i32.store
        get_local 7
        i32.const 12
        i32.add
        set_local 125
        get_local 125
        get_local 114
        i32.store
        return
        end
        get_local 13
        i32.const 8
        i32.shr_u
        set_local 126
        get_local 126
        i32.const 0
        i32.eq
        set_local 127
        get_local 127
        if  ;; label = @1
        i32.const 0
        set_local 5
        else
        get_local 13
        i32.const 16777215
        i32.gt_u
        set_local 128
        get_local 128
        if  ;; label = @2
            i32.const 31
            set_local 5
        else
            get_local 126
            i32.const 1048320
            i32.add
            set_local 129
            get_local 129
            i32.const 16
            i32.shr_u
            set_local 130
            get_local 130
            i32.const 8
            i32.and
            set_local 133
            get_local 126
            get_local 133
            i32.shl
            set_local 134
            get_local 134
            i32.const 520192
            i32.add
            set_local 135
            get_local 135
            i32.const 16
            i32.shr_u
            set_local 136
            get_local 136
            i32.const 4
            i32.and
            set_local 137
            get_local 137
            get_local 133
            i32.or
            set_local 138
            get_local 134
            get_local 137
            i32.shl
            set_local 139
            get_local 139
            i32.const 245760
            i32.add
            set_local 140
            get_local 140
            i32.const 16
            i32.shr_u
            set_local 141
            get_local 141
            i32.const 2
            i32.and
            set_local 142
            get_local 138
            get_local 142
            i32.or
            set_local 144
            i32.const 14
            get_local 144
            i32.sub
            set_local 145
            get_local 139
            get_local 142
            i32.shl
            set_local 146
            get_local 146
            i32.const 15
            i32.shr_u
            set_local 147
            get_local 145
            get_local 147
            i32.add
            set_local 148
            get_local 148
            i32.const 1
            i32.shl
            set_local 149
            get_local 148
            i32.const 7
            i32.add
            set_local 150
            get_local 13
            get_local 150
            i32.shr_u
            set_local 151
            get_local 151
            i32.const 1
            i32.and
            set_local 152
            get_local 152
            get_local 149
            i32.or
            set_local 153
            get_local 153
            set_local 5
        end
        end
        i32.const 1456
        get_local 5
        i32.const 2
        i32.shl
        i32.add
        set_local 155
        get_local 7
        i32.const 28
        i32.add
        set_local 156
        get_local 156
        get_local 5
        i32.store
        get_local 7
        i32.const 16
        i32.add
        set_local 157
        get_local 7
        i32.const 20
        i32.add
        set_local 158
        get_local 158
        i32.const 0
        i32.store
        get_local 157
        i32.const 0
        i32.store
        i32.const 1156
        i32.load
        set_local 159
        i32.const 1
        get_local 5
        i32.shl
        set_local 160
        get_local 159
        get_local 160
        i32.and
        set_local 161
        get_local 161
        i32.const 0
        i32.eq
        set_local 162
        block  ;; label = @1
        get_local 162
        if  ;; label = @2
            get_local 159
            get_local 160
            i32.or
            set_local 163
            i32.const 1156
            get_local 163
            i32.store
            get_local 155
            get_local 7
            i32.store
            get_local 7
            i32.const 24
            i32.add
            set_local 164
            get_local 164
            get_local 155
            i32.store
            get_local 7
            i32.const 12
            i32.add
            set_local 166
            get_local 166
            get_local 7
            i32.store
            get_local 7
            i32.const 8
            i32.add
            set_local 167
            get_local 167
            get_local 7
            i32.store
        else
            get_local 155
            i32.load
            set_local 168
            get_local 5
            i32.const 31
            i32.eq
            set_local 169
            get_local 5
            i32.const 1
            i32.shr_u
            set_local 170
            i32.const 25
            get_local 170
            i32.sub
            set_local 171
            get_local 169
            if (result i32)  ;; label = @3
            i32.const 0
            else
            get_local 171
            end
            set_local 172
            get_local 13
            get_local 172
            i32.shl
            set_local 173
            get_local 173
            set_local 3
            get_local 168
            set_local 4
            loop  ;; label = @3
            block  ;; label = @4
                get_local 4
                i32.const 4
                i32.add
                set_local 174
                get_local 174
                i32.load
                set_local 175
                get_local 175
                i32.const -8
                i32.and
                set_local 177
                get_local 177
                get_local 13
                i32.eq
                set_local 178
                get_local 178
                if  ;; label = @5
                i32.const 73
                set_local 282
                br 1 (;@4;)
                end
                get_local 3
                i32.const 31
                i32.shr_u
                set_local 179
                get_local 4
                i32.const 16
                i32.add
                get_local 179
                i32.const 2
                i32.shl
                i32.add
                set_local 180
                get_local 3
                i32.const 1
                i32.shl
                set_local 181
                get_local 180
                i32.load
                set_local 182
                get_local 182
                i32.const 0
                i32.eq
                set_local 183
                get_local 183
                if  ;; label = @5
                i32.const 72
                set_local 282
                br 1 (;@4;)
                else
                get_local 181
                set_local 3
                get_local 182
                set_local 4
                end
                br 1 (;@3;)
            end
            end
            get_local 282
            i32.const 72
            i32.eq
            if  ;; label = @3
            get_local 180
            get_local 7
            i32.store
            get_local 7
            i32.const 24
            i32.add
            set_local 184
            get_local 184
            get_local 4
            i32.store
            get_local 7
            i32.const 12
            i32.add
            set_local 185
            get_local 185
            get_local 7
            i32.store
            get_local 7
            i32.const 8
            i32.add
            set_local 186
            get_local 186
            get_local 7
            i32.store
            br 2 (;@1;)
            else
            get_local 282
            i32.const 73
            i32.eq
            if  ;; label = @4
                get_local 4
                i32.const 8
                i32.add
                set_local 188
                get_local 188
                i32.load
                set_local 189
                get_local 189
                i32.const 12
                i32.add
                set_local 190
                get_local 190
                get_local 7
                i32.store
                get_local 188
                get_local 7
                i32.store
                get_local 7
                i32.const 8
                i32.add
                set_local 191
                get_local 191
                get_local 189
                i32.store
                get_local 7
                i32.const 12
                i32.add
                set_local 192
                get_local 192
                get_local 4
                i32.store
                get_local 7
                i32.const 24
                i32.add
                set_local 193
                get_local 193
                i32.const 0
                i32.store
                br 3 (;@1;)
            end
            end
        end
        end
        i32.const 1184
        i32.load
        set_local 194
        get_local 194
        i32.const -1
        i32.add
        set_local 195
        i32.const 1184
        get_local 195
        i32.store
        get_local 195
        i32.const 0
        i32.eq
        set_local 196
        get_local 196
        if  ;; label = @1
        i32.const 1608
        set_local 2
        else
        return
        end
        loop  ;; label = @1
        block  ;; label = @2
            get_local 2
            i32.load
            set_local 1
            get_local 1
            i32.const 0
            i32.eq
            set_local 197
            get_local 1
            i32.const 8
            i32.add
            set_local 199
            get_local 197
            if  ;; label = @3
            br 1 (;@2;)
            else
            get_local 199
            set_local 2
            end
            br 1 (;@1;)
        end
        end
        i32.const 1184
        i32.const -1
        i32.store
        return)
    (func $free_02 (type $3) (param i32)
        (local i32 i32 i32 i32 i32 i32 i32 i32)
        get_local 0
        i32.eqz
        if  ;; label = @1
        return
        end
        i32.const 1040
        i32.load
        set_local 4
        get_local 0
        i32.const -8
        i32.add
        tee_local 1
        get_local 0
        i32.const -4
        i32.add
        i32.load
        tee_local 0
        i32.const -8
        i32.and
        tee_local 3
        i32.add
        set_local 5
        block (result i32)  ;; label = @1
        get_local 0
        i32.const 1
        i32.and
        if (result i32)  ;; label = @2
            get_local 1
            set_local 0
            get_local 1
        else
            get_local 1
            i32.load
            set_local 2
            get_local 0
            i32.const 3
            i32.and
            i32.eqz
            if  ;; label = @3
            return
            end
            get_local 1
            get_local 2
            i32.sub
            tee_local 0
            get_local 4
            i32.lt_u
            if  ;; label = @3
            return
            end
            get_local 2
            get_local 3
            i32.add
            set_local 3
            i32.const 1044
            i32.load
            get_local 0
            i32.eq
            if  ;; label = @3
            get_local 0
            get_local 5
            i32.const 4
            i32.add
            tee_local 2
            i32.load
            tee_local 1
            i32.const 3
            i32.and
            i32.const 3
            i32.ne
            br_if 2 (;@1;)
            drop
            i32.const 1032
            get_local 3
            i32.store
            get_local 2
            get_local 1
            i32.const -2
            i32.and
            i32.store
            get_local 0
            get_local 3
            i32.const 1
            i32.or
            i32.store offset=4
            get_local 0
            get_local 3
            i32.add
            get_local 3
            i32.store
            return
            end
            get_local 2
            i32.const 3
            i32.shr_u
            set_local 4
            get_local 2
            i32.const 256
            i32.lt_u
            if  ;; label = @3
            get_local 0
            i32.load offset=12
            tee_local 2
            get_local 0
            i32.load offset=8
            tee_local 1
            i32.eq
            if  ;; label = @4
                i32.const 1024
                i32.const 1024
                i32.load
                i32.const 1
                get_local 4
                i32.shl
                i32.const -1
                i32.xor
                i32.and
                i32.store
                get_local 0
                br 3 (;@1;)
            else
                get_local 1
                get_local 2
                i32.store offset=12
                get_local 2
                get_local 1
                i32.store offset=8
                get_local 0
                br 3 (;@1;)
            end
            unreachable
            end
            get_local 0
            i32.load offset=24
            set_local 7
            block  ;; label = @3
            get_local 0
            i32.load offset=12
            tee_local 2
            get_local 0
            i32.eq
            if  ;; label = @4
                get_local 0
                i32.const 16
                i32.add
                tee_local 1
                i32.const 4
                i32.add
                tee_local 4
                i32.load
                tee_local 2
                if  ;; label = @5
                get_local 4
                set_local 1
                else
                get_local 1
                i32.load
                tee_local 2
                i32.eqz
                if  ;; label = @6
                    i32.const 0
                    set_local 2
                    br 3 (;@3;)
                end
                end
                loop  ;; label = @5
                get_local 2
                i32.const 20
                i32.add
                tee_local 4
                i32.load
                tee_local 6
                if  ;; label = @6
                    get_local 6
                    set_local 2
                    get_local 4
                    set_local 1
                    br 1 (;@5;)
                end
                get_local 2
                i32.const 16
                i32.add
                tee_local 4
                i32.load
                tee_local 6
                if  ;; label = @6
                    get_local 6
                    set_local 2
                    get_local 4
                    set_local 1
                    br 1 (;@5;)
                end
                end
                get_local 1
                i32.const 0
                i32.store
            else
                get_local 0
                i32.load offset=8
                tee_local 1
                get_local 2
                i32.store offset=12
                get_local 2
                get_local 1
                i32.store offset=8
            end
            end
            get_local 7
            if (result i32)  ;; label = @3
            get_local 0
            i32.load offset=28
            tee_local 1
            i32.const 2
            i32.shl
            i32.const 1328
            i32.add
            tee_local 4
            i32.load
            get_local 0
            i32.eq
            if  ;; label = @4
                get_local 4
                get_local 2
                i32.store
                get_local 2
                i32.eqz
                if  ;; label = @5
                i32.const 1028
                i32.const 1028
                i32.load
                i32.const 1
                get_local 1
                i32.shl
                i32.const -1
                i32.xor
                i32.and
                i32.store
                get_local 0
                br 4 (;@1;)
                end
            else
                get_local 7
                i32.const 16
                i32.add
                get_local 7
                i32.load offset=16
                get_local 0
                i32.ne
                i32.const 2
                i32.shl
                i32.add
                get_local 2
                i32.store
                get_local 0
                get_local 2
                i32.eqz
                br_if 3 (;@1;)
                drop
            end
            get_local 2
            get_local 7
            i32.store offset=24
            get_local 0
            i32.const 16
            i32.add
            tee_local 4
            i32.load
            tee_local 1
            if  ;; label = @4
                get_local 2
                get_local 1
                i32.store offset=16
                get_local 1
                get_local 2
                i32.store offset=24
            end
            get_local 4
            i32.load offset=4
            tee_local 1
            if (result i32)  ;; label = @4
                get_local 2
                get_local 1
                i32.store offset=20
                get_local 1
                get_local 2
                i32.store offset=24
                get_local 0
            else
                get_local 0
            end
            else
            get_local 0
            end
        end
        end
        set_local 2
        get_local 0
        get_local 5
        i32.ge_u
        if  ;; label = @1
        return
        end
        get_local 5
        i32.const 4
        i32.add
        tee_local 4
        i32.load
        tee_local 1
        i32.const 1
        i32.and
        i32.eqz
        if  ;; label = @1
        return
        end
        get_local 1
        i32.const 2
        i32.and
        if  ;; label = @1
        get_local 4
        get_local 1
        i32.const -2
        i32.and
        i32.store
        get_local 2
        get_local 3
        i32.const 1
        i32.or
        i32.store offset=4
        get_local 0
        get_local 3
        i32.add
        get_local 3
        i32.store
        else
        i32.const 1048
        i32.load
        get_local 5
        i32.eq
        if  ;; label = @2
            i32.const 1036
            i32.const 1036
            i32.load
            get_local 3
            i32.add
            tee_local 0
            i32.store
            i32.const 1048
            get_local 2
            i32.store
            get_local 2
            get_local 0
            i32.const 1
            i32.or
            i32.store offset=4
            get_local 2
            i32.const 1044
            i32.load
            i32.ne
            if  ;; label = @3
            return
            end
            i32.const 1044
            i32.const 0
            i32.store
            i32.const 1032
            i32.const 0
            i32.store
            return
        end
        i32.const 1044
        i32.load
        get_local 5
        i32.eq
        if  ;; label = @2
            i32.const 1032
            i32.const 1032
            i32.load
            get_local 3
            i32.add
            tee_local 3
            i32.store
            i32.const 1044
            get_local 0
            i32.store
            get_local 2
            get_local 3
            i32.const 1
            i32.or
            i32.store offset=4
            get_local 0
            get_local 3
            i32.add
            get_local 3
            i32.store
            return
        end
        get_local 1
        i32.const -8
        i32.and
        get_local 3
        i32.add
        set_local 7
        get_local 1
        i32.const 3
        i32.shr_u
        set_local 4
        block  ;; label = @2
            get_local 1
            i32.const 256
            i32.lt_u
            if  ;; label = @3
            get_local 5
            i32.load offset=12
            tee_local 3
            get_local 5
            i32.load offset=8
            tee_local 1
            i32.eq
            if  ;; label = @4
                i32.const 1024
                i32.const 1024
                i32.load
                i32.const 1
                get_local 4
                i32.shl
                i32.const -1
                i32.xor
                i32.and
                i32.store
            else
                get_local 1
                get_local 3
                i32.store offset=12
                get_local 3
                get_local 1
                i32.store offset=8
            end
            else
            get_local 5
            i32.load offset=24
            set_local 8
            block  ;; label = @4
                get_local 5
                i32.load offset=12
                tee_local 3
                get_local 5
                i32.eq
                if  ;; label = @5
                get_local 5
                i32.const 16
                i32.add
                tee_local 1
                i32.const 4
                i32.add
                tee_local 4
                i32.load
                tee_local 3
                if  ;; label = @6
                    get_local 4
                    set_local 1
                else
                    get_local 1
                    i32.load
                    tee_local 3
                    i32.eqz
                    if  ;; label = @7
                    i32.const 0
                    set_local 3
                    br 3 (;@4;)
                    end
                end
                loop  ;; label = @6
                    get_local 3
                    i32.const 20
                    i32.add
                    tee_local 4
                    i32.load
                    tee_local 6
                    if  ;; label = @7
                    get_local 6
                    set_local 3
                    get_local 4
                    set_local 1
                    br 1 (;@6;)
                    end
                    get_local 3
                    i32.const 16
                    i32.add
                    tee_local 4
                    i32.load
                    tee_local 6
                    if  ;; label = @7
                    get_local 6
                    set_local 3
                    get_local 4
                    set_local 1
                    br 1 (;@6;)
                    end
                end
                get_local 1
                i32.const 0
                i32.store
                else
                get_local 5
                i32.load offset=8
                tee_local 1
                get_local 3
                i32.store offset=12
                get_local 3
                get_local 1
                i32.store offset=8
                end
            end
            get_local 8
            if  ;; label = @4
                get_local 5
                i32.load offset=28
                tee_local 1
                i32.const 2
                i32.shl
                i32.const 1328
                i32.add
                tee_local 4
                i32.load
                get_local 5
                i32.eq
                if  ;; label = @5
                get_local 4
                get_local 3
                i32.store
                get_local 3
                i32.eqz
                if  ;; label = @6
                    i32.const 1028
                    i32.const 1028
                    i32.load
                    i32.const 1
                    get_local 1
                    i32.shl
                    i32.const -1
                    i32.xor
                    i32.and
                    i32.store
                    br 4 (;@2;)
                end
                else
                get_local 8
                i32.const 16
                i32.add
                get_local 8
                i32.load offset=16
                get_local 5
                i32.ne
                i32.const 2
                i32.shl
                i32.add
                get_local 3
                i32.store
                get_local 3
                i32.eqz
                br_if 3 (;@2;)
                end
                get_local 3
                get_local 8
                i32.store offset=24
                get_local 5
                i32.const 16
                i32.add
                tee_local 4
                i32.load
                tee_local 1
                if  ;; label = @5
                get_local 3
                get_local 1
                i32.store offset=16
                get_local 1
                get_local 3
                i32.store offset=24
                end
                get_local 4
                i32.load offset=4
                tee_local 1
                if  ;; label = @5
                get_local 3
                get_local 1
                i32.store offset=20
                get_local 1
                get_local 3
                i32.store offset=24
                end
            end
            end
        end
        get_local 2
        get_local 7
        i32.const 1
        i32.or
        i32.store offset=4
        get_local 0
        get_local 7
        i32.add
        get_local 7
        i32.store
        get_local 2
        i32.const 1044
        i32.load
        i32.eq
        if  ;; label = @2
            i32.const 1032
            get_local 7
            i32.store
            return
        else
            get_local 7
            set_local 3
        end
        end
        get_local 3
        i32.const 3
        i32.shr_u
        set_local 1
        get_local 3
        i32.const 256
        i32.lt_u
        if  ;; label = @1
        get_local 1
        i32.const 3
        i32.shl
        i32.const 1064
        i32.add
        set_local 0
        i32.const 1024
        i32.load
        tee_local 3
        i32.const 1
        get_local 1
        i32.shl
        tee_local 1
        i32.and
        if (result i32)  ;; label = @2
            get_local 0
            i32.const 8
            i32.add
            tee_local 1
            i32.load
        else
            i32.const 1024
            get_local 3
            get_local 1
            i32.or
            i32.store
            get_local 0
            i32.const 8
            i32.add
            set_local 1
            get_local 0
        end
        set_local 3
        get_local 1
        get_local 2
        i32.store
        get_local 3
        get_local 2
        i32.store offset=12
        get_local 2
        get_local 3
        i32.store offset=8
        get_local 2
        get_local 0
        i32.store offset=12
        return
        end
        get_local 3
        i32.const 8
        i32.shr_u
        tee_local 0
        if (result i32)  ;; label = @1
        get_local 3
        i32.const 16777215
        i32.gt_u
        if (result i32)  ;; label = @2
            i32.const 31
        else
            get_local 3
            i32.const 14
            get_local 0
            get_local 0
            i32.const 1048320
            i32.add
            i32.const 16
            i32.shr_u
            i32.const 8
            i32.and
            tee_local 0
            i32.shl
            tee_local 1
            i32.const 520192
            i32.add
            i32.const 16
            i32.shr_u
            i32.const 4
            i32.and
            tee_local 4
            get_local 0
            i32.or
            get_local 1
            get_local 4
            i32.shl
            tee_local 0
            i32.const 245760
            i32.add
            i32.const 16
            i32.shr_u
            i32.const 2
            i32.and
            tee_local 1
            i32.or
            i32.sub
            get_local 0
            get_local 1
            i32.shl
            i32.const 15
            i32.shr_u
            i32.add
            tee_local 0
            i32.const 7
            i32.add
            i32.shr_u
            i32.const 1
            i32.and
            get_local 0
            i32.const 1
            i32.shl
            i32.or
        end
        else
        i32.const 0
        end
        tee_local 1
        i32.const 2
        i32.shl
        i32.const 1328
        i32.add
        set_local 0
        get_local 2
        get_local 1
        i32.store offset=28
        get_local 2
        i32.const 0
        i32.store offset=20
        get_local 2
        i32.const 0
        i32.store offset=16
        block  ;; label = @1
        i32.const 1028
        i32.load
        tee_local 4
        i32.const 1
        get_local 1
        i32.shl
        tee_local 6
        i32.and
        if  ;; label = @2
            get_local 0
            i32.load
            set_local 0
            i32.const 25
            get_local 1
            i32.const 1
            i32.shr_u
            i32.sub
            set_local 4
            get_local 3
            get_local 1
            i32.const 31
            i32.eq
            if (result i32)  ;; label = @3
            i32.const 0
            else
            get_local 4
            end
            i32.shl
            set_local 1
            block  ;; label = @3
            loop  ;; label = @4
                get_local 0
                i32.load offset=4
                i32.const -8
                i32.and
                get_local 3
                i32.eq
                br_if 1 (;@3;)
                get_local 1
                i32.const 1
                i32.shl
                set_local 4
                get_local 0
                i32.const 16
                i32.add
                get_local 1
                i32.const 31
                i32.shr_u
                i32.const 2
                i32.shl
                i32.add
                tee_local 1
                i32.load
                tee_local 6
                if  ;; label = @5
                get_local 4
                set_local 1
                get_local 6
                set_local 0
                br 1 (;@4;)
                end
            end
            get_local 1
            get_local 2
            i32.store
            get_local 2
            get_local 0
            i32.store offset=24
            get_local 2
            get_local 2
            i32.store offset=12
            get_local 2
            get_local 2
            i32.store offset=8
            br 2 (;@1;)
            end
            get_local 0
            i32.const 8
            i32.add
            tee_local 3
            i32.load
            tee_local 1
            get_local 2
            i32.store offset=12
            get_local 3
            get_local 2
            i32.store
            get_local 2
            get_local 1
            i32.store offset=8
            get_local 2
            get_local 0
            i32.store offset=12
            get_local 2
            i32.const 0
            i32.store offset=24
        else
            i32.const 1028
            get_local 4
            get_local 6
            i32.or
            i32.store
            get_local 0
            get_local 2
            i32.store
            get_local 2
            get_local 0
            i32.store offset=24
            get_local 2
            get_local 2
            i32.store offset=12
            get_local 2
            get_local 2
            i32.store offset=8
        end
        end
        i32.const 1056
        i32.const 1056
        i32.load
        i32.const -1
        i32.add
        tee_local 0
        i32.store
        get_local 0
        if  ;; label = @1
        return
        else
        i32.const 1480
        set_local 0
        end
        loop  ;; label = @1
        get_local 0
        i32.load
        tee_local 3
        i32.const 8
        i32.add
        set_local 0
        get_local 3
        br_if 0 (;@1;)
        end
        i32.const 1056
        i32.const -1
        i32.store)
    (func $malloc_02 (type $1) (param i32) (result i32)
        (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
        get_global  $STACKTOP
        set_local 10
        get_global  $STACKTOP
        i32.const 16
        i32.add
        set_global  $STACKTOP
        get_local 10
        set_local 8
        block  ;; label = @1
        get_local 0
        i32.const 245
        i32.lt_u
        if  ;; label = @2
            get_local 0
            i32.const 11
            i32.add
            i32.const -8
            i32.and
            set_local 3
            i32.const 1024
            i32.load
            tee_local 6
            get_local 0
            i32.const 11
            i32.lt_u
            if (result i32)  ;; label = @3
            i32.const 16
            tee_local 3
            else
            get_local 3
            end
            i32.const 3
            i32.shr_u
            tee_local 0
            i32.shr_u
            tee_local 1
            i32.const 3
            i32.and
            if  ;; label = @3
            get_local 1
            i32.const 1
            i32.and
            i32.const 1
            i32.xor
            get_local 0
            i32.add
            tee_local 0
            i32.const 3
            i32.shl
            i32.const 1064
            i32.add
            tee_local 1
            i32.const 8
            i32.add
            tee_local 5
            i32.load
            tee_local 3
            i32.const 8
            i32.add
            tee_local 4
            i32.load
            tee_local 2
            get_local 1
            i32.eq
            if  ;; label = @4
                i32.const 1024
                get_local 6
                i32.const 1
                get_local 0
                i32.shl
                i32.const -1
                i32.xor
                i32.and
                i32.store
            else
                get_local 2
                get_local 1
                i32.store offset=12
                get_local 5
                get_local 2
                i32.store
            end
            get_local 3
            get_local 0
            i32.const 3
            i32.shl
            tee_local 0
            i32.const 3
            i32.or
            i32.store offset=4
            get_local 3
            get_local 0
            i32.add
            i32.const 4
            i32.add
            tee_local 0
            get_local 0
            i32.load
            i32.const 1
            i32.or
            i32.store
            get_local 10
            set_global  $STACKTOP
            get_local 4
            return
            end
            get_local 3
            i32.const 1032
            i32.load
            tee_local 9
            i32.gt_u
            if  ;; label = @3
            get_local 1
            if  ;; label = @4
                get_local 1
                get_local 0
                i32.shl
                i32.const 2
                get_local 0
                i32.shl
                tee_local 0
                i32.const 0
                get_local 0
                i32.sub
                i32.or
                i32.and
                tee_local 0
                i32.const 0
                get_local 0
                i32.sub
                i32.and
                i32.const -1
                i32.add
                tee_local 1
                i32.const 12
                i32.shr_u
                i32.const 16
                i32.and
                set_local 0
                get_local 1
                get_local 0
                i32.shr_u
                tee_local 1
                i32.const 5
                i32.shr_u
                i32.const 8
                i32.and
                tee_local 2
                get_local 0
                i32.or
                get_local 1
                get_local 2
                i32.shr_u
                tee_local 0
                i32.const 2
                i32.shr_u
                i32.const 4
                i32.and
                tee_local 1
                i32.or
                get_local 0
                get_local 1
                i32.shr_u
                tee_local 0
                i32.const 1
                i32.shr_u
                i32.const 2
                i32.and
                tee_local 1
                i32.or
                get_local 0
                get_local 1
                i32.shr_u
                tee_local 0
                i32.const 1
                i32.shr_u
                i32.const 1
                i32.and
                tee_local 1
                i32.or
                get_local 0
                get_local 1
                i32.shr_u
                i32.add
                tee_local 2
                i32.const 3
                i32.shl
                i32.const 1064
                i32.add
                tee_local 0
                i32.const 8
                i32.add
                tee_local 4
                i32.load
                tee_local 1
                i32.const 8
                i32.add
                tee_local 7
                i32.load
                tee_local 5
                get_local 0
                i32.eq
                if  ;; label = @5
                i32.const 1024
                get_local 6
                i32.const 1
                get_local 2
                i32.shl
                i32.const -1
                i32.xor
                i32.and
                tee_local 0
                i32.store
                else
                get_local 5
                get_local 0
                i32.store offset=12
                get_local 4
                get_local 5
                i32.store
                get_local 6
                set_local 0
                end
                get_local 1
                get_local 3
                i32.const 3
                i32.or
                i32.store offset=4
                get_local 1
                get_local 3
                i32.add
                tee_local 4
                get_local 2
                i32.const 3
                i32.shl
                tee_local 2
                get_local 3
                i32.sub
                tee_local 5
                i32.const 1
                i32.or
                i32.store offset=4
                get_local 1
                get_local 2
                i32.add
                get_local 5
                i32.store
                get_local 9
                if  ;; label = @5
                i32.const 1044
                i32.load
                set_local 2
                get_local 9
                i32.const 3
                i32.shr_u
                tee_local 3
                i32.const 3
                i32.shl
                i32.const 1064
                i32.add
                set_local 1
                get_local 0
                i32.const 1
                get_local 3
                i32.shl
                tee_local 3
                i32.and
                if (result i32)  ;; label = @6
                    get_local 1
                    i32.const 8
                    i32.add
                    tee_local 3
                    i32.load
                else
                    i32.const 1024
                    get_local 0
                    get_local 3
                    i32.or
                    i32.store
                    get_local 1
                    i32.const 8
                    i32.add
                    set_local 3
                    get_local 1
                end
                set_local 0
                get_local 3
                get_local 2
                i32.store
                get_local 0
                get_local 2
                i32.store offset=12
                get_local 2
                get_local 0
                i32.store offset=8
                get_local 2
                get_local 1
                i32.store offset=12
                end
                i32.const 1032
                get_local 5
                i32.store
                i32.const 1044
                get_local 4
                i32.store
                get_local 10
                set_global  $STACKTOP
                get_local 7
                return
            end
            i32.const 1028
            i32.load
            tee_local 12
            if  ;; label = @4
                get_local 12
                i32.const 0
                get_local 12
                i32.sub
                i32.and
                i32.const -1
                i32.add
                tee_local 1
                i32.const 12
                i32.shr_u
                i32.const 16
                i32.and
                set_local 0
                get_local 1
                get_local 0
                i32.shr_u
                tee_local 1
                i32.const 5
                i32.shr_u
                i32.const 8
                i32.and
                tee_local 2
                get_local 0
                i32.or
                get_local 1
                get_local 2
                i32.shr_u
                tee_local 0
                i32.const 2
                i32.shr_u
                i32.const 4
                i32.and
                tee_local 1
                i32.or
                get_local 0
                get_local 1
                i32.shr_u
                tee_local 0
                i32.const 1
                i32.shr_u
                i32.const 2
                i32.and
                tee_local 1
                i32.or
                get_local 0
                get_local 1
                i32.shr_u
                tee_local 0
                i32.const 1
                i32.shr_u
                i32.const 1
                i32.and
                tee_local 1
                i32.or
                get_local 0
                get_local 1
                i32.shr_u
                i32.add
                i32.const 2
                i32.shl
                i32.const 1328
                i32.add
                i32.load
                tee_local 2
                i32.load offset=4
                i32.const -8
                i32.and
                get_local 3
                i32.sub
                set_local 1
                get_local 2
                i32.const 16
                i32.add
                get_local 2
                i32.load offset=16
                i32.eqz
                i32.const 2
                i32.shl
                i32.add
                i32.load
                tee_local 0
                if  ;; label = @5
                loop  ;; label = @6
                    get_local 0
                    i32.load offset=4
                    i32.const -8
                    i32.and
                    get_local 3
                    i32.sub
                    tee_local 5
                    get_local 1
                    i32.lt_u
                    tee_local 4
                    if  ;; label = @7
                    get_local 5
                    set_local 1
                    end
                    get_local 4
                    if  ;; label = @7
                    get_local 0
                    set_local 2
                    end
                    get_local 0
                    i32.const 16
                    i32.add
                    get_local 0
                    i32.load offset=16
                    i32.eqz
                    i32.const 2
                    i32.shl
                    i32.add
                    i32.load
                    tee_local 0
                    br_if 0 (;@6;)
                    get_local 1
                    set_local 5
                end
                else
                get_local 1
                set_local 5
                end
                get_local 2
                get_local 3
                i32.add
                tee_local 11
                get_local 2
                i32.gt_u
                if  ;; label = @5
                get_local 2
                i32.load offset=24
                set_local 8
                block  ;; label = @6
                    get_local 2
                    i32.load offset=12
                    tee_local 0
                    get_local 2
                    i32.eq
                    if  ;; label = @7
                    get_local 2
                    i32.const 20
                    i32.add
                    tee_local 1
                    i32.load
                    tee_local 0
                    i32.eqz
                    if  ;; label = @8
                        get_local 2
                        i32.const 16
                        i32.add
                        tee_local 1
                        i32.load
                        tee_local 0
                        i32.eqz
                        if  ;; label = @9
                        i32.const 0
                        set_local 0
                        br 3 (;@6;)
                        end
                    end
                    loop  ;; label = @8
                        get_local 0
                        i32.const 20
                        i32.add
                        tee_local 4
                        i32.load
                        tee_local 7
                        if  ;; label = @9
                        get_local 7
                        set_local 0
                        get_local 4
                        set_local 1
                        br 1 (;@8;)
                        end
                        get_local 0
                        i32.const 16
                        i32.add
                        tee_local 4
                        i32.load
                        tee_local 7
                        if  ;; label = @9
                        get_local 7
                        set_local 0
                        get_local 4
                        set_local 1
                        br 1 (;@8;)
                        end
                    end
                    get_local 1
                    i32.const 0
                    i32.store
                    else
                    get_local 2
                    i32.load offset=8
                    tee_local 1
                    get_local 0
                    i32.store offset=12
                    get_local 0
                    get_local 1
                    i32.store offset=8
                    end
                end
                block  ;; label = @6
                    get_local 8
                    if  ;; label = @7
                    get_local 2
                    get_local 2
                    i32.load offset=28
                    tee_local 1
                    i32.const 2
                    i32.shl
                    i32.const 1328
                    i32.add
                    tee_local 4
                    i32.load
                    i32.eq
                    if  ;; label = @8
                        get_local 4
                        get_local 0
                        i32.store
                        get_local 0
                        i32.eqz
                        if  ;; label = @9
                        i32.const 1028
                        get_local 12
                        i32.const 1
                        get_local 1
                        i32.shl
                        i32.const -1
                        i32.xor
                        i32.and
                        i32.store
                        br 3 (;@6;)
                        end
                    else
                        get_local 8
                        i32.const 16
                        i32.add
                        get_local 8
                        i32.load offset=16
                        get_local 2
                        i32.ne
                        i32.const 2
                        i32.shl
                        i32.add
                        get_local 0
                        i32.store
                        get_local 0
                        i32.eqz
                        br_if 2 (;@6;)
                    end
                    get_local 0
                    get_local 8
                    i32.store offset=24
                    get_local 2
                    i32.load offset=16
                    tee_local 1
                    if  ;; label = @8
                        get_local 0
                        get_local 1
                        i32.store offset=16
                        get_local 1
                        get_local 0
                        i32.store offset=24
                    end
                    get_local 2
                    i32.load offset=20
                    tee_local 1
                    if  ;; label = @8
                        get_local 0
                        get_local 1
                        i32.store offset=20
                        get_local 1
                        get_local 0
                        i32.store offset=24
                    end
                    end
                end
                get_local 5
                i32.const 16
                i32.lt_u
                if  ;; label = @6
                    get_local 2
                    get_local 5
                    get_local 3
                    i32.add
                    tee_local 0
                    i32.const 3
                    i32.or
                    i32.store offset=4
                    get_local 2
                    get_local 0
                    i32.add
                    i32.const 4
                    i32.add
                    tee_local 0
                    get_local 0
                    i32.load
                    i32.const 1
                    i32.or
                    i32.store
                else
                    get_local 2
                    get_local 3
                    i32.const 3
                    i32.or
                    i32.store offset=4
                    get_local 11
                    get_local 5
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    get_local 11
                    get_local 5
                    i32.add
                    get_local 5
                    i32.store
                    get_local 9
                    if  ;; label = @7
                    i32.const 1044
                    i32.load
                    set_local 4
                    get_local 9
                    i32.const 3
                    i32.shr_u
                    tee_local 1
                    i32.const 3
                    i32.shl
                    i32.const 1064
                    i32.add
                    set_local 0
                    get_local 6
                    i32.const 1
                    get_local 1
                    i32.shl
                    tee_local 1
                    i32.and
                    if (result i32)  ;; label = @8
                        get_local 0
                        i32.const 8
                        i32.add
                        tee_local 3
                        i32.load
                    else
                        i32.const 1024
                        get_local 6
                        get_local 1
                        i32.or
                        i32.store
                        get_local 0
                        i32.const 8
                        i32.add
                        set_local 3
                        get_local 0
                    end
                    set_local 1
                    get_local 3
                    get_local 4
                    i32.store
                    get_local 1
                    get_local 4
                    i32.store offset=12
                    get_local 4
                    get_local 1
                    i32.store offset=8
                    get_local 4
                    get_local 0
                    i32.store offset=12
                    end
                    i32.const 1032
                    get_local 5
                    i32.store
                    i32.const 1044
                    get_local 11
                    i32.store
                end
                get_local 10
                set_global  $STACKTOP
                get_local 2
                i32.const 8
                i32.add
                return
                else
                get_local 3
                set_local 0
                end
            else
                get_local 3
                set_local 0
            end
            else
            get_local 3
            set_local 0
            end
        else
            get_local 0
            i32.const -65
            i32.gt_u
            if  ;; label = @3
            i32.const -1
            set_local 0
            else
            get_local 0
            i32.const 11
            i32.add
            tee_local 0
            i32.const -8
            i32.and
            set_local 2
            i32.const 1028
            i32.load
            tee_local 5
            if  ;; label = @4
                get_local 0
                i32.const 8
                i32.shr_u
                tee_local 0
                if (result i32)  ;; label = @5
                get_local 2
                i32.const 16777215
                i32.gt_u
                if (result i32)  ;; label = @6
                    i32.const 31
                else
                    get_local 2
                    i32.const 14
                    get_local 0
                    get_local 0
                    i32.const 1048320
                    i32.add
                    i32.const 16
                    i32.shr_u
                    i32.const 8
                    i32.and
                    tee_local 0
                    i32.shl
                    tee_local 1
                    i32.const 520192
                    i32.add
                    i32.const 16
                    i32.shr_u
                    i32.const 4
                    i32.and
                    tee_local 3
                    get_local 0
                    i32.or
                    get_local 1
                    get_local 3
                    i32.shl
                    tee_local 0
                    i32.const 245760
                    i32.add
                    i32.const 16
                    i32.shr_u
                    i32.const 2
                    i32.and
                    tee_local 1
                    i32.or
                    i32.sub
                    get_local 0
                    get_local 1
                    i32.shl
                    i32.const 15
                    i32.shr_u
                    i32.add
                    tee_local 0
                    i32.const 7
                    i32.add
                    i32.shr_u
                    i32.const 1
                    i32.and
                    get_local 0
                    i32.const 1
                    i32.shl
                    i32.or
                end
                else
                i32.const 0
                end
                set_local 9
                i32.const 0
                get_local 2
                i32.sub
                set_local 3
                block  ;; label = @5
                block  ;; label = @6
                    get_local 9
                    i32.const 2
                    i32.shl
                    i32.const 1328
                    i32.add
                    i32.load
                    tee_local 0
                    if  ;; label = @7
                    i32.const 25
                    get_local 9
                    i32.const 1
                    i32.shr_u
                    i32.sub
                    set_local 4
                    i32.const 0
                    set_local 1
                    get_local 2
                    get_local 9
                    i32.const 31
                    i32.eq
                    if (result i32)  ;; label = @8
                        i32.const 0
                    else
                        get_local 4
                    end
                    i32.shl
                    set_local 7
                    i32.const 0
                    set_local 4
                    loop  ;; label = @8
                        get_local 0
                        i32.load offset=4
                        i32.const -8
                        i32.and
                        get_local 2
                        i32.sub
                        tee_local 6
                        get_local 3
                        i32.lt_u
                        if  ;; label = @9
                        get_local 6
                        if  ;; label = @10
                            get_local 0
                            set_local 1
                            get_local 6
                            set_local 3
                        else
                            i32.const 0
                            set_local 3
                            get_local 0
                            set_local 1
                            br 4 (;@6;)
                        end
                        end
                        get_local 0
                        i32.load offset=20
                        tee_local 6
                        i32.eqz
                        get_local 6
                        get_local 0
                        i32.const 16
                        i32.add
                        get_local 7
                        i32.const 31
                        i32.shr_u
                        i32.const 2
                        i32.shl
                        i32.add
                        i32.load
                        tee_local 0
                        i32.eq
                        i32.or
                        i32.eqz
                        if  ;; label = @9
                        get_local 6
                        set_local 4
                        end
                        get_local 7
                        get_local 0
                        i32.eqz
                        tee_local 6
                        i32.const 1
                        i32.xor
                        i32.shl
                        set_local 7
                        get_local 6
                        i32.eqz
                        br_if 0 (;@8;)
                        get_local 1
                        set_local 0
                    end
                    else
                    i32.const 0
                    set_local 0
                    end
                    get_local 4
                    get_local 0
                    i32.or
                    if (result i32)  ;; label = @7
                    get_local 4
                    else
                    get_local 5
                    i32.const 2
                    get_local 9
                    i32.shl
                    tee_local 0
                    i32.const 0
                    get_local 0
                    i32.sub
                    i32.or
                    i32.and
                    tee_local 0
                    i32.eqz
                    if  ;; label = @8
                        get_local 2
                        set_local 0
                        br 7 (;@1;)
                    end
                    get_local 0
                    i32.const 0
                    get_local 0
                    i32.sub
                    i32.and
                    i32.const -1
                    i32.add
                    tee_local 4
                    i32.const 12
                    i32.shr_u
                    i32.const 16
                    i32.and
                    set_local 1
                    i32.const 0
                    set_local 0
                    get_local 4
                    get_local 1
                    i32.shr_u
                    tee_local 4
                    i32.const 5
                    i32.shr_u
                    i32.const 8
                    i32.and
                    tee_local 7
                    get_local 1
                    i32.or
                    get_local 4
                    get_local 7
                    i32.shr_u
                    tee_local 1
                    i32.const 2
                    i32.shr_u
                    i32.const 4
                    i32.and
                    tee_local 4
                    i32.or
                    get_local 1
                    get_local 4
                    i32.shr_u
                    tee_local 1
                    i32.const 1
                    i32.shr_u
                    i32.const 2
                    i32.and
                    tee_local 4
                    i32.or
                    get_local 1
                    get_local 4
                    i32.shr_u
                    tee_local 1
                    i32.const 1
                    i32.shr_u
                    i32.const 1
                    i32.and
                    tee_local 4
                    i32.or
                    get_local 1
                    get_local 4
                    i32.shr_u
                    i32.add
                    i32.const 2
                    i32.shl
                    i32.const 1328
                    i32.add
                    i32.load
                    end
                    tee_local 1
                    br_if 0 (;@6;)
                    get_local 0
                    set_local 4
                    br 1 (;@5;)
                end
                loop  ;; label = @6
                    get_local 1
                    i32.load offset=4
                    i32.const -8
                    i32.and
                    get_local 2
                    i32.sub
                    tee_local 4
                    get_local 3
                    i32.lt_u
                    tee_local 7
                    if  ;; label = @7
                    get_local 4
                    set_local 3
                    end
                    get_local 7
                    if  ;; label = @7
                    get_local 1
                    set_local 0
                    end
                    get_local 1
                    i32.const 16
                    i32.add
                    get_local 1
                    i32.load offset=16
                    i32.eqz
                    i32.const 2
                    i32.shl
                    i32.add
                    i32.load
                    tee_local 1
                    br_if 0 (;@6;)
                    get_local 0
                    set_local 4
                end
                end
                get_local 4
                if  ;; label = @5
                get_local 3
                i32.const 1032
                i32.load
                get_local 2
                i32.sub
                i32.lt_u
                if  ;; label = @6
                    get_local 4
                    get_local 2
                    i32.add
                    tee_local 8
                    get_local 4
                    i32.le_u
                    if  ;; label = @7
                    get_local 10
                    set_global  $STACKTOP
                    i32.const 0
                    return
                    end
                    get_local 4
                    i32.load offset=24
                    set_local 9
                    block  ;; label = @7
                    get_local 4
                    i32.load offset=12
                    tee_local 0
                    get_local 4
                    i32.eq
                    if  ;; label = @8
                        get_local 4
                        i32.const 20
                        i32.add
                        tee_local 1
                        i32.load
                        tee_local 0
                        i32.eqz
                        if  ;; label = @9
                        get_local 4
                        i32.const 16
                        i32.add
                        tee_local 1
                        i32.load
                        tee_local 0
                        i32.eqz
                        if  ;; label = @10
                            i32.const 0
                            set_local 0
                            br 3 (;@7;)
                        end
                        end
                        loop  ;; label = @9
                        get_local 0
                        i32.const 20
                        i32.add
                        tee_local 7
                        i32.load
                        tee_local 6
                        if  ;; label = @10
                            get_local 6
                            set_local 0
                            get_local 7
                            set_local 1
                            br 1 (;@9;)
                        end
                        get_local 0
                        i32.const 16
                        i32.add
                        tee_local 7
                        i32.load
                        tee_local 6
                        if  ;; label = @10
                            get_local 6
                            set_local 0
                            get_local 7
                            set_local 1
                            br 1 (;@9;)
                        end
                        end
                        get_local 1
                        i32.const 0
                        i32.store
                    else
                        get_local 4
                        i32.load offset=8
                        tee_local 1
                        get_local 0
                        i32.store offset=12
                        get_local 0
                        get_local 1
                        i32.store offset=8
                    end
                    end
                    block  ;; label = @7
                    get_local 9
                    if (result i32)  ;; label = @8
                        get_local 4
                        get_local 4
                        i32.load offset=28
                        tee_local 1
                        i32.const 2
                        i32.shl
                        i32.const 1328
                        i32.add
                        tee_local 7
                        i32.load
                        i32.eq
                        if  ;; label = @9
                        get_local 7
                        get_local 0
                        i32.store
                        get_local 0
                        i32.eqz
                        if  ;; label = @10
                            i32.const 1028
                            get_local 5
                            i32.const 1
                            get_local 1
                            i32.shl
                            i32.const -1
                            i32.xor
                            i32.and
                            tee_local 0
                            i32.store
                            br 3 (;@7;)
                        end
                        else
                        get_local 9
                        i32.const 16
                        i32.add
                        get_local 9
                        i32.load offset=16
                        get_local 4
                        i32.ne
                        i32.const 2
                        i32.shl
                        i32.add
                        get_local 0
                        i32.store
                        get_local 0
                        i32.eqz
                        if  ;; label = @10
                            get_local 5
                            set_local 0
                            br 3 (;@7;)
                        end
                        end
                        get_local 0
                        get_local 9
                        i32.store offset=24
                        get_local 4
                        i32.load offset=16
                        tee_local 1
                        if  ;; label = @9
                        get_local 0
                        get_local 1
                        i32.store offset=16
                        get_local 1
                        get_local 0
                        i32.store offset=24
                        end
                        get_local 4
                        i32.load offset=20
                        tee_local 1
                        if (result i32)  ;; label = @9
                        get_local 0
                        get_local 1
                        i32.store offset=20
                        get_local 1
                        get_local 0
                        i32.store offset=24
                        get_local 5
                        else
                        get_local 5
                        end
                    else
                        get_local 5
                    end
                    set_local 0
                    end
                    block  ;; label = @7
                    get_local 3
                    i32.const 16
                    i32.lt_u
                    if  ;; label = @8
                        get_local 4
                        get_local 3
                        get_local 2
                        i32.add
                        tee_local 0
                        i32.const 3
                        i32.or
                        i32.store offset=4
                        get_local 4
                        get_local 0
                        i32.add
                        i32.const 4
                        i32.add
                        tee_local 0
                        get_local 0
                        i32.load
                        i32.const 1
                        i32.or
                        i32.store
                    else
                        get_local 4
                        get_local 2
                        i32.const 3
                        i32.or
                        i32.store offset=4
                        get_local 8
                        get_local 3
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        get_local 8
                        get_local 3
                        i32.add
                        get_local 3
                        i32.store
                        get_local 3
                        i32.const 3
                        i32.shr_u
                        set_local 1
                        get_local 3
                        i32.const 256
                        i32.lt_u
                        if  ;; label = @9
                        get_local 1
                        i32.const 3
                        i32.shl
                        i32.const 1064
                        i32.add
                        set_local 0
                        i32.const 1024
                        i32.load
                        tee_local 3
                        i32.const 1
                        get_local 1
                        i32.shl
                        tee_local 1
                        i32.and
                        if (result i32)  ;; label = @10
                            get_local 0
                            i32.const 8
                            i32.add
                            tee_local 3
                            i32.load
                        else
                            i32.const 1024
                            get_local 3
                            get_local 1
                            i32.or
                            i32.store
                            get_local 0
                            i32.const 8
                            i32.add
                            set_local 3
                            get_local 0
                        end
                        set_local 1
                        get_local 3
                        get_local 8
                        i32.store
                        get_local 1
                        get_local 8
                        i32.store offset=12
                        get_local 8
                        get_local 1
                        i32.store offset=8
                        get_local 8
                        get_local 0
                        i32.store offset=12
                        br 2 (;@7;)
                        end
                        get_local 3
                        i32.const 8
                        i32.shr_u
                        tee_local 1
                        if (result i32)  ;; label = @9
                        get_local 3
                        i32.const 16777215
                        i32.gt_u
                        if (result i32)  ;; label = @10
                            i32.const 31
                        else
                            get_local 3
                            i32.const 14
                            get_local 1
                            get_local 1
                            i32.const 1048320
                            i32.add
                            i32.const 16
                            i32.shr_u
                            i32.const 8
                            i32.and
                            tee_local 1
                            i32.shl
                            tee_local 2
                            i32.const 520192
                            i32.add
                            i32.const 16
                            i32.shr_u
                            i32.const 4
                            i32.and
                            tee_local 5
                            get_local 1
                            i32.or
                            get_local 2
                            get_local 5
                            i32.shl
                            tee_local 1
                            i32.const 245760
                            i32.add
                            i32.const 16
                            i32.shr_u
                            i32.const 2
                            i32.and
                            tee_local 2
                            i32.or
                            i32.sub
                            get_local 1
                            get_local 2
                            i32.shl
                            i32.const 15
                            i32.shr_u
                            i32.add
                            tee_local 1
                            i32.const 7
                            i32.add
                            i32.shr_u
                            i32.const 1
                            i32.and
                            get_local 1
                            i32.const 1
                            i32.shl
                            i32.or
                        end
                        else
                        i32.const 0
                        end
                        tee_local 1
                        i32.const 2
                        i32.shl
                        i32.const 1328
                        i32.add
                        set_local 2
                        get_local 8
                        get_local 1
                        i32.store offset=28
                        get_local 8
                        i32.const 16
                        i32.add
                        tee_local 5
                        i32.const 0
                        i32.store offset=4
                        get_local 5
                        i32.const 0
                        i32.store
                        get_local 0
                        i32.const 1
                        get_local 1
                        i32.shl
                        tee_local 5
                        i32.and
                        i32.eqz
                        if  ;; label = @9
                        i32.const 1028
                        get_local 0
                        get_local 5
                        i32.or
                        i32.store
                        get_local 2
                        get_local 8
                        i32.store
                        get_local 8
                        get_local 2
                        i32.store offset=24
                        get_local 8
                        get_local 8
                        i32.store offset=12
                        get_local 8
                        get_local 8
                        i32.store offset=8
                        br 2 (;@7;)
                        end
                        get_local 2
                        i32.load
                        set_local 0
                        i32.const 25
                        get_local 1
                        i32.const 1
                        i32.shr_u
                        i32.sub
                        set_local 2
                        get_local 3
                        get_local 1
                        i32.const 31
                        i32.eq
                        if (result i32)  ;; label = @9
                        i32.const 0
                        else
                        get_local 2
                        end
                        i32.shl
                        set_local 1
                        block  ;; label = @9
                        loop  ;; label = @10
                            get_local 0
                            i32.load offset=4
                            i32.const -8
                            i32.and
                            get_local 3
                            i32.eq
                            br_if 1 (;@9;)
                            get_local 1
                            i32.const 1
                            i32.shl
                            set_local 2
                            get_local 0
                            i32.const 16
                            i32.add
                            get_local 1
                            i32.const 31
                            i32.shr_u
                            i32.const 2
                            i32.shl
                            i32.add
                            tee_local 1
                            i32.load
                            tee_local 5
                            if  ;; label = @11
                            get_local 2
                            set_local 1
                            get_local 5
                            set_local 0
                            br 1 (;@10;)
                            end
                        end
                        get_local 1
                        get_local 8
                        i32.store
                        get_local 8
                        get_local 0
                        i32.store offset=24
                        get_local 8
                        get_local 8
                        i32.store offset=12
                        get_local 8
                        get_local 8
                        i32.store offset=8
                        br 2 (;@7;)
                        end
                        get_local 0
                        i32.const 8
                        i32.add
                        tee_local 1
                        i32.load
                        tee_local 3
                        get_local 8
                        i32.store offset=12
                        get_local 1
                        get_local 8
                        i32.store
                        get_local 8
                        get_local 3
                        i32.store offset=8
                        get_local 8
                        get_local 0
                        i32.store offset=12
                        get_local 8
                        i32.const 0
                        i32.store offset=24
                    end
                    end
                    get_local 10
                    set_global  $STACKTOP
                    get_local 4
                    i32.const 8
                    i32.add
                    return
                else
                    get_local 2
                    set_local 0
                end
                else
                get_local 2
                set_local 0
                end
            else
                get_local 2
                set_local 0
            end
            end
        end
        end
        i32.const 1032
        i32.load
        tee_local 3
        get_local 0
        i32.ge_u
        if  ;; label = @1
        i32.const 1044
        i32.load
        set_local 1
        get_local 3
        get_local 0
        i32.sub
        tee_local 2
        i32.const 15
        i32.gt_u
        if  ;; label = @2
            i32.const 1044
            get_local 1
            get_local 0
            i32.add
            tee_local 5
            i32.store
            i32.const 1032
            get_local 2
            i32.store
            get_local 5
            get_local 2
            i32.const 1
            i32.or
            i32.store offset=4
            get_local 1
            get_local 3
            i32.add
            get_local 2
            i32.store
            get_local 1
            get_local 0
            i32.const 3
            i32.or
            i32.store offset=4
        else
            i32.const 1032
            i32.const 0
            i32.store
            i32.const 1044
            i32.const 0
            i32.store
            get_local 1
            get_local 3
            i32.const 3
            i32.or
            i32.store offset=4
            get_local 1
            get_local 3
            i32.add
            i32.const 4
            i32.add
            tee_local 0
            get_local 0
            i32.load
            i32.const 1
            i32.or
            i32.store
        end
        get_local 10
        set_global  $STACKTOP
        get_local 1
        i32.const 8
        i32.add
        return
        end
        i32.const 1036
        i32.load
        tee_local 3
        get_local 0
        i32.gt_u
        if  ;; label = @1
        i32.const 1036
        get_local 3
        get_local 0
        i32.sub
        tee_local 3
        i32.store
        i32.const 1048
        i32.const 1048
        i32.load
        tee_local 1
        get_local 0
        i32.add
        tee_local 2
        i32.store
        get_local 2
        get_local 3
        i32.const 1
        i32.or
        i32.store offset=4
        get_local 1
        get_local 0
        i32.const 3
        i32.or
        i32.store offset=4
        get_local 10
        set_global  $STACKTOP
        get_local 1
        i32.const 8
        i32.add
        return
        end
        i32.const 1496
        i32.load
        if (result i32)  ;; label = @1
        i32.const 1504
        i32.load
        else
        i32.const 1504
        i32.const 4096
        i32.store
        i32.const 1500
        i32.const 4096
        i32.store
        i32.const 1508
        i32.const -1
        i32.store
        i32.const 1512
        i32.const -1
        i32.store
        i32.const 1516
        i32.const 0
        i32.store
        i32.const 1468
        i32.const 0
        i32.store
        i32.const 1496
        get_local 8
        i32.const -16
        i32.and
        i32.const 1431655768
        i32.xor
        i32.store
        i32.const 4096
        end
        tee_local 1
        get_local 0
        i32.const 47
        i32.add
        tee_local 4
        i32.add
        tee_local 7
        i32.const 0
        get_local 1
        i32.sub
        tee_local 6
        i32.and
        tee_local 5
        get_local 0
        i32.le_u
        if  ;; label = @1
        get_local 10
        set_global  $STACKTOP
        i32.const 0
        return
        end
        i32.const 1464
        i32.load
        tee_local 1
        if  ;; label = @1
        i32.const 1456
        i32.load
        tee_local 2
        get_local 5
        i32.add
        tee_local 8
        get_local 2
        i32.le_u
        get_local 8
        get_local 1
        i32.gt_u
        i32.or
        if  ;; label = @2
            get_local 10
            set_global  $STACKTOP
            i32.const 0
            return
        end
        end
        get_local 0
        i32.const 48
        i32.add
        set_local 8
        block  ;; label = @1
        block  ;; label = @2
            i32.const 1468
            i32.load
            i32.const 4
            i32.and
            if  ;; label = @3
            i32.const 0
            set_local 3
            else
            block  ;; label = @4
                block  ;; label = @5
                block  ;; label = @6
                    i32.const 1048
                    i32.load
                    tee_local 1
                    i32.eqz
                    br_if 0 (;@6;)
                    i32.const 1472
                    set_local 2
                    loop  ;; label = @7
                    block  ;; label = @8
                        get_local 2
                        i32.load
                        tee_local 9
                        get_local 1
                        i32.le_u
                        if  ;; label = @9
                        get_local 9
                        get_local 2
                        i32.const 4
                        i32.add
                        tee_local 9
                        i32.load
                        i32.add
                        get_local 1
                        i32.gt_u
                        br_if 1 (;@8;)
                        end
                        get_local 2
                        i32.load offset=8
                        tee_local 2
                        br_if 1 (;@7;)
                        br 2 (;@6;)
                    end
                    end
                    get_local 7
                    get_local 3
                    i32.sub
                    get_local 6
                    i32.and
                    tee_local 3
                    i32.const 2147483647
                    i32.lt_u
                    if  ;; label = @7
                    get_local 3
                    call $sbrk_02
                    tee_local 1
                    get_local 2
                    i32.load
                    get_local 9
                    i32.load
                    i32.add
                    i32.eq
                    if  ;; label = @8
                        get_local 1
                        i32.const -1
                        i32.ne
                        br_if 6 (;@2;)
                    else
                        br 3 (;@5;)
                    end
                    else
                    i32.const 0
                    set_local 3
                    end
                    br 2 (;@4;)
                end
                i32.const 0
                call $sbrk_02
                tee_local 1
                i32.const -1
                i32.eq
                if  ;; label = @6
                    i32.const 0
                    set_local 3
                else
                    i32.const 1500
                    i32.load
                    tee_local 2
                    i32.const -1
                    i32.add
                    tee_local 7
                    get_local 1
                    tee_local 3
                    i32.add
                    i32.const 0
                    get_local 2
                    i32.sub
                    i32.and
                    get_local 3
                    i32.sub
                    set_local 2
                    get_local 7
                    get_local 3
                    i32.and
                    if (result i32)  ;; label = @7
                    get_local 2
                    else
                    i32.const 0
                    end
                    get_local 5
                    i32.add
                    tee_local 3
                    i32.const 1456
                    i32.load
                    tee_local 7
                    i32.add
                    set_local 2
                    get_local 3
                    get_local 0
                    i32.gt_u
                    get_local 3
                    i32.const 2147483647
                    i32.lt_u
                    i32.and
                    if  ;; label = @7
                    i32.const 1464
                    i32.load
                    tee_local 6
                    if  ;; label = @8
                        get_local 2
                        get_local 7
                        i32.le_u
                        get_local 2
                        get_local 6
                        i32.gt_u
                        i32.or
                        if  ;; label = @9
                        i32.const 0
                        set_local 3
                        br 5 (;@4;)
                        end
                    end
                    get_local 3
                    call $sbrk_02
                    tee_local 2
                    get_local 1
                    i32.eq
                    br_if 5 (;@2;)
                    get_local 2
                    set_local 1
                    br 2 (;@5;)
                    else
                    i32.const 0
                    set_local 3
                    end
                end
                br 1 (;@4;)
                end
                get_local 8
                get_local 3
                i32.gt_u
                get_local 3
                i32.const 2147483647
                i32.lt_u
                get_local 1
                i32.const -1
                i32.ne
                i32.and
                i32.and
                i32.eqz
                if  ;; label = @5
                get_local 1
                i32.const -1
                i32.eq
                if  ;; label = @6
                    i32.const 0
                    set_local 3
                    br 2 (;@4;)
                else
                    br 4 (;@2;)
                end
                unreachable
                end
                get_local 4
                get_local 3
                i32.sub
                i32.const 1504
                i32.load
                tee_local 2
                i32.add
                i32.const 0
                get_local 2
                i32.sub
                i32.and
                tee_local 2
                i32.const 2147483647
                i32.ge_u
                br_if 2 (;@2;)
                i32.const 0
                get_local 3
                i32.sub
                set_local 4
                get_local 2
                call $sbrk_02
                i32.const -1
                i32.eq
                if  ;; label = @5
                get_local 4
                call $sbrk_02
                drop
                i32.const 0
                set_local 3
                else
                get_local 2
                get_local 3
                i32.add
                set_local 3
                br 3 (;@2;)
                end
            end
            i32.const 1468
            i32.const 1468
            i32.load
            i32.const 4
            i32.or
            i32.store
            end
            get_local 5
            i32.const 2147483647
            i32.lt_u
            if  ;; label = @3
            get_local 5
            call $sbrk_02
            tee_local 1
            i32.const 0
            call $sbrk_02
            tee_local 2
            i32.lt_u
            get_local 1
            i32.const -1
            i32.ne
            get_local 2
            i32.const -1
            i32.ne
            i32.and
            i32.and
            set_local 5
            get_local 2
            get_local 1
            i32.sub
            tee_local 2
            get_local 0
            i32.const 40
            i32.add
            i32.gt_u
            tee_local 4
            if  ;; label = @4
                get_local 2
                set_local 3
            end
            get_local 1
            i32.const -1
            i32.eq
            get_local 4
            i32.const 1
            i32.xor
            i32.or
            get_local 5
            i32.const 1
            i32.xor
            i32.or
            i32.eqz
            br_if 1 (;@2;)
            end
            br 1 (;@1;)
        end
        i32.const 1456
        i32.const 1456
        i32.load
        get_local 3
        i32.add
        tee_local 2
        i32.store
        get_local 2
        i32.const 1460
        i32.load
        i32.gt_u
        if  ;; label = @2
            i32.const 1460
            get_local 2
            i32.store
        end
        block  ;; label = @2
            i32.const 1048
            i32.load
            tee_local 4
            if  ;; label = @3
            i32.const 1472
            set_local 2
            block  ;; label = @4
                block  ;; label = @5
                loop  ;; label = @6
                    get_local 1
                    get_local 2
                    i32.load
                    tee_local 5
                    get_local 2
                    i32.const 4
                    i32.add
                    tee_local 7
                    i32.load
                    tee_local 6
                    i32.add
                    i32.eq
                    br_if 1 (;@5;)
                    get_local 2
                    i32.load offset=8
                    tee_local 2
                    br_if 0 (;@6;)
                end
                br 1 (;@4;)
                end
                get_local 2
                i32.load offset=12
                i32.const 8
                i32.and
                i32.eqz
                if  ;; label = @5
                get_local 1
                get_local 4
                i32.gt_u
                get_local 5
                get_local 4
                i32.le_u
                i32.and
                if  ;; label = @6
                    get_local 7
                    get_local 6
                    get_local 3
                    i32.add
                    i32.store
                    i32.const 1036
                    i32.load
                    get_local 3
                    i32.add
                    set_local 3
                    i32.const 0
                    get_local 4
                    i32.const 8
                    i32.add
                    tee_local 2
                    i32.sub
                    i32.const 7
                    i32.and
                    set_local 1
                    i32.const 1048
                    get_local 4
                    get_local 2
                    i32.const 7
                    i32.and
                    if (result i32)  ;; label = @7
                    get_local 1
                    else
                    i32.const 0
                    tee_local 1
                    end
                    i32.add
                    tee_local 2
                    i32.store
                    i32.const 1036
                    get_local 3
                    get_local 1
                    i32.sub
                    tee_local 1
                    i32.store
                    get_local 2
                    get_local 1
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    get_local 4
                    get_local 3
                    i32.add
                    i32.const 40
                    i32.store offset=4
                    i32.const 1052
                    i32.const 1512
                    i32.load
                    i32.store
                    br 4 (;@2;)
                end
                end
            end
            get_local 1
            i32.const 1040
            i32.load
            i32.lt_u
            if  ;; label = @4
                i32.const 1040
                get_local 1
                i32.store
            end
            get_local 1
            get_local 3
            i32.add
            set_local 5
            i32.const 1472
            set_local 2
            block  ;; label = @4
                block  ;; label = @5
                loop  ;; label = @6
                    get_local 2
                    i32.load
                    get_local 5
                    i32.eq
                    br_if 1 (;@5;)
                    get_local 2
                    i32.load offset=8
                    tee_local 2
                    br_if 0 (;@6;)
                    i32.const 1472
                    set_local 2
                end
                br 1 (;@4;)
                end
                get_local 2
                i32.load offset=12
                i32.const 8
                i32.and
                if  ;; label = @5
                i32.const 1472
                set_local 2
                else
                get_local 2
                get_local 1
                i32.store
                get_local 2
                i32.const 4
                i32.add
                tee_local 2
                get_local 2
                i32.load
                get_local 3
                i32.add
                i32.store
                i32.const 0
                get_local 1
                i32.const 8
                i32.add
                tee_local 3
                i32.sub
                i32.const 7
                i32.and
                set_local 2
                i32.const 0
                get_local 5
                i32.const 8
                i32.add
                tee_local 7
                i32.sub
                i32.const 7
                i32.and
                set_local 9
                get_local 1
                get_local 3
                i32.const 7
                i32.and
                if (result i32)  ;; label = @6
                    get_local 2
                else
                    i32.const 0
                end
                i32.add
                tee_local 8
                get_local 0
                i32.add
                set_local 6
                get_local 5
                get_local 7
                i32.const 7
                i32.and
                if (result i32)  ;; label = @6
                    get_local 9
                else
                    i32.const 0
                end
                i32.add
                tee_local 5
                get_local 8
                i32.sub
                get_local 0
                i32.sub
                set_local 7
                get_local 8
                get_local 0
                i32.const 3
                i32.or
                i32.store offset=4
                block  ;; label = @6
                    get_local 4
                    get_local 5
                    i32.eq
                    if  ;; label = @7
                    i32.const 1036
                    i32.const 1036
                    i32.load
                    get_local 7
                    i32.add
                    tee_local 0
                    i32.store
                    i32.const 1048
                    get_local 6
                    i32.store
                    get_local 6
                    get_local 0
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    else
                    i32.const 1044
                    i32.load
                    get_local 5
                    i32.eq
                    if  ;; label = @8
                        i32.const 1032
                        i32.const 1032
                        i32.load
                        get_local 7
                        i32.add
                        tee_local 0
                        i32.store
                        i32.const 1044
                        get_local 6
                        i32.store
                        get_local 6
                        get_local 0
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        get_local 6
                        get_local 0
                        i32.add
                        get_local 0
                        i32.store
                        br 2 (;@6;)
                    end
                    get_local 5
                    i32.load offset=4
                    tee_local 0
                    i32.const 3
                    i32.and
                    i32.const 1
                    i32.eq
                    if (result i32)  ;; label = @8
                        get_local 0
                        i32.const -8
                        i32.and
                        set_local 9
                        get_local 0
                        i32.const 3
                        i32.shr_u
                        set_local 3
                        block  ;; label = @9
                        get_local 0
                        i32.const 256
                        i32.lt_u
                        if  ;; label = @10
                            get_local 5
                            i32.load offset=12
                            tee_local 0
                            get_local 5
                            i32.load offset=8
                            tee_local 1
                            i32.eq
                            if  ;; label = @11
                            i32.const 1024
                            i32.const 1024
                            i32.load
                            i32.const 1
                            get_local 3
                            i32.shl
                            i32.const -1
                            i32.xor
                            i32.and
                            i32.store
                            else
                            get_local 1
                            get_local 0
                            i32.store offset=12
                            get_local 0
                            get_local 1
                            i32.store offset=8
                            end
                        else
                            get_local 5
                            i32.load offset=24
                            set_local 4
                            block  ;; label = @11
                            get_local 5
                            i32.load offset=12
                            tee_local 0
                            get_local 5
                            i32.eq
                            if  ;; label = @12
                                get_local 5
                                i32.const 16
                                i32.add
                                tee_local 1
                                i32.const 4
                                i32.add
                                tee_local 3
                                i32.load
                                tee_local 0
                                if  ;; label = @13
                                get_local 3
                                set_local 1
                                else
                                get_local 1
                                i32.load
                                tee_local 0
                                i32.eqz
                                if  ;; label = @14
                                    i32.const 0
                                    set_local 0
                                    br 3 (;@11;)
                                end
                                end
                                loop  ;; label = @13
                                get_local 0
                                i32.const 20
                                i32.add
                                tee_local 3
                                i32.load
                                tee_local 2
                                if  ;; label = @14
                                    get_local 2
                                    set_local 0
                                    get_local 3
                                    set_local 1
                                    br 1 (;@13;)
                                end
                                get_local 0
                                i32.const 16
                                i32.add
                                tee_local 3
                                i32.load
                                tee_local 2
                                if  ;; label = @14
                                    get_local 2
                                    set_local 0
                                    get_local 3
                                    set_local 1
                                    br 1 (;@13;)
                                end
                                end
                                get_local 1
                                i32.const 0
                                i32.store
                            else
                                get_local 5
                                i32.load offset=8
                                tee_local 1
                                get_local 0
                                i32.store offset=12
                                get_local 0
                                get_local 1
                                i32.store offset=8
                            end
                            end
                            get_local 4
                            i32.eqz
                            br_if 1 (;@9;)
                            block  ;; label = @11
                            get_local 5
                            i32.load offset=28
                            tee_local 1
                            i32.const 2
                            i32.shl
                            i32.const 1328
                            i32.add
                            tee_local 3
                            i32.load
                            get_local 5
                            i32.eq
                            if  ;; label = @12
                                get_local 3
                                get_local 0
                                i32.store
                                get_local 0
                                br_if 1 (;@11;)
                                i32.const 1028
                                i32.const 1028
                                i32.load
                                i32.const 1
                                get_local 1
                                i32.shl
                                i32.const -1
                                i32.xor
                                i32.and
                                i32.store
                                br 3 (;@9;)
                            else
                                get_local 4
                                i32.const 16
                                i32.add
                                get_local 4
                                i32.load offset=16
                                get_local 5
                                i32.ne
                                i32.const 2
                                i32.shl
                                i32.add
                                get_local 0
                                i32.store
                                get_local 0
                                i32.eqz
                                br_if 3 (;@9;)
                            end
                            end
                            get_local 0
                            get_local 4
                            i32.store offset=24
                            get_local 5
                            i32.const 16
                            i32.add
                            tee_local 3
                            i32.load
                            tee_local 1
                            if  ;; label = @11
                            get_local 0
                            get_local 1
                            i32.store offset=16
                            get_local 1
                            get_local 0
                            i32.store offset=24
                            end
                            get_local 3
                            i32.load offset=4
                            tee_local 1
                            i32.eqz
                            br_if 1 (;@9;)
                            get_local 0
                            get_local 1
                            i32.store offset=20
                            get_local 1
                            get_local 0
                            i32.store offset=24
                        end
                        end
                        get_local 5
                        get_local 9
                        i32.add
                        set_local 0
                        get_local 9
                        get_local 7
                        i32.add
                    else
                        get_local 5
                        set_local 0
                        get_local 7
                    end
                    set_local 5
                    get_local 0
                    i32.const 4
                    i32.add
                    tee_local 0
                    get_local 0
                    i32.load
                    i32.const -2
                    i32.and
                    i32.store
                    get_local 6
                    get_local 5
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    get_local 6
                    get_local 5
                    i32.add
                    get_local 5
                    i32.store
                    get_local 5
                    i32.const 3
                    i32.shr_u
                    set_local 1
                    get_local 5
                    i32.const 256
                    i32.lt_u
                    if  ;; label = @8
                        get_local 1
                        i32.const 3
                        i32.shl
                        i32.const 1064
                        i32.add
                        set_local 0
                        i32.const 1024
                        i32.load
                        tee_local 3
                        i32.const 1
                        get_local 1
                        i32.shl
                        tee_local 1
                        i32.and
                        if (result i32)  ;; label = @9
                        get_local 0
                        i32.const 8
                        i32.add
                        tee_local 3
                        i32.load
                        else
                        i32.const 1024
                        get_local 3
                        get_local 1
                        i32.or
                        i32.store
                        get_local 0
                        i32.const 8
                        i32.add
                        set_local 3
                        get_local 0
                        end
                        set_local 1
                        get_local 3
                        get_local 6
                        i32.store
                        get_local 1
                        get_local 6
                        i32.store offset=12
                        get_local 6
                        get_local 1
                        i32.store offset=8
                        get_local 6
                        get_local 0
                        i32.store offset=12
                        br 2 (;@6;)
                    end
                    block (result i32)  ;; label = @8
                        get_local 5
                        i32.const 8
                        i32.shr_u
                        tee_local 0
                        if (result i32)  ;; label = @9
                        i32.const 31
                        get_local 5
                        i32.const 16777215
                        i32.gt_u
                        br_if 1 (;@8;)
                        drop
                        get_local 5
                        i32.const 14
                        get_local 0
                        get_local 0
                        i32.const 1048320
                        i32.add
                        i32.const 16
                        i32.shr_u
                        i32.const 8
                        i32.and
                        tee_local 0
                        i32.shl
                        tee_local 1
                        i32.const 520192
                        i32.add
                        i32.const 16
                        i32.shr_u
                        i32.const 4
                        i32.and
                        tee_local 3
                        get_local 0
                        i32.or
                        get_local 1
                        get_local 3
                        i32.shl
                        tee_local 0
                        i32.const 245760
                        i32.add
                        i32.const 16
                        i32.shr_u
                        i32.const 2
                        i32.and
                        tee_local 1
                        i32.or
                        i32.sub
                        get_local 0
                        get_local 1
                        i32.shl
                        i32.const 15
                        i32.shr_u
                        i32.add
                        tee_local 0
                        i32.const 7
                        i32.add
                        i32.shr_u
                        i32.const 1
                        i32.and
                        get_local 0
                        i32.const 1
                        i32.shl
                        i32.or
                        else
                        i32.const 0
                        end
                    end
                    tee_local 1
                    i32.const 2
                    i32.shl
                    i32.const 1328
                    i32.add
                    set_local 0
                    get_local 6
                    get_local 1
                    i32.store offset=28
                    get_local 6
                    i32.const 16
                    i32.add
                    tee_local 3
                    i32.const 0
                    i32.store offset=4
                    get_local 3
                    i32.const 0
                    i32.store
                    i32.const 1028
                    i32.load
                    tee_local 3
                    i32.const 1
                    get_local 1
                    i32.shl
                    tee_local 2
                    i32.and
                    i32.eqz
                    if  ;; label = @8
                        i32.const 1028
                        get_local 3
                        get_local 2
                        i32.or
                        i32.store
                        get_local 0
                        get_local 6
                        i32.store
                        get_local 6
                        get_local 0
                        i32.store offset=24
                        get_local 6
                        get_local 6
                        i32.store offset=12
                        get_local 6
                        get_local 6
                        i32.store offset=8
                        br 2 (;@6;)
                    end
                    get_local 0
                    i32.load
                    set_local 0
                    i32.const 25
                    get_local 1
                    i32.const 1
                    i32.shr_u
                    i32.sub
                    set_local 3
                    get_local 5
                    get_local 1
                    i32.const 31
                    i32.eq
                    if (result i32)  ;; label = @8
                        i32.const 0
                    else
                        get_local 3
                    end
                    i32.shl
                    set_local 1
                    block  ;; label = @8
                        loop  ;; label = @9
                        get_local 0
                        i32.load offset=4
                        i32.const -8
                        i32.and
                        get_local 5
                        i32.eq
                        br_if 1 (;@8;)
                        get_local 1
                        i32.const 1
                        i32.shl
                        set_local 3
                        get_local 0
                        i32.const 16
                        i32.add
                        get_local 1
                        i32.const 31
                        i32.shr_u
                        i32.const 2
                        i32.shl
                        i32.add
                        tee_local 1
                        i32.load
                        tee_local 2
                        if  ;; label = @10
                            get_local 3
                            set_local 1
                            get_local 2
                            set_local 0
                            br 1 (;@9;)
                        end
                        end
                        get_local 1
                        get_local 6
                        i32.store
                        get_local 6
                        get_local 0
                        i32.store offset=24
                        get_local 6
                        get_local 6
                        i32.store offset=12
                        get_local 6
                        get_local 6
                        i32.store offset=8
                        br 2 (;@6;)
                    end
                    get_local 0
                    i32.const 8
                    i32.add
                    tee_local 1
                    i32.load
                    tee_local 3
                    get_local 6
                    i32.store offset=12
                    get_local 1
                    get_local 6
                    i32.store
                    get_local 6
                    get_local 3
                    i32.store offset=8
                    get_local 6
                    get_local 0
                    i32.store offset=12
                    get_local 6
                    i32.const 0
                    i32.store offset=24
                    end
                end
                get_local 10
                set_global  $STACKTOP
                get_local 8
                i32.const 8
                i32.add
                return
                end
            end
            loop  ;; label = @4
                block  ;; label = @5
                get_local 2
                i32.load
                tee_local 5
                get_local 4
                i32.le_u
                if  ;; label = @6
                    get_local 5
                    get_local 2
                    i32.load offset=4
                    i32.add
                    tee_local 8
                    get_local 4
                    i32.gt_u
                    br_if 1 (;@5;)
                end
                get_local 2
                i32.load offset=8
                set_local 2
                br 1 (;@4;)
                end
            end
            i32.const 0
            get_local 8
            i32.const -47
            i32.add
            tee_local 2
            i32.const 8
            i32.add
            tee_local 5
            i32.sub
            i32.const 7
            i32.and
            set_local 7
            get_local 2
            get_local 5
            i32.const 7
            i32.and
            if (result i32)  ;; label = @4
                get_local 7
            else
                i32.const 0
            end
            i32.add
            tee_local 2
            get_local 4
            i32.const 16
            i32.add
            tee_local 12
            i32.lt_u
            if (result i32)  ;; label = @4
                get_local 4
                tee_local 2
            else
                get_local 2
            end
            i32.const 8
            i32.add
            set_local 6
            get_local 2
            i32.const 24
            i32.add
            set_local 5
            get_local 3
            i32.const -40
            i32.add
            set_local 9
            i32.const 0
            get_local 1
            i32.const 8
            i32.add
            tee_local 11
            i32.sub
            i32.const 7
            i32.and
            set_local 7
            i32.const 1048
            get_local 1
            get_local 11
            i32.const 7
            i32.and
            if (result i32)  ;; label = @4
                get_local 7
            else
                i32.const 0
                tee_local 7
            end
            i32.add
            tee_local 11
            i32.store
            i32.const 1036
            get_local 9
            get_local 7
            i32.sub
            tee_local 7
            i32.store
            get_local 11
            get_local 7
            i32.const 1
            i32.or
            i32.store offset=4
            get_local 1
            get_local 9
            i32.add
            i32.const 40
            i32.store offset=4
            i32.const 1052
            i32.const 1512
            i32.load
            i32.store
            get_local 2
            i32.const 4
            i32.add
            tee_local 7
            i32.const 27
            i32.store
            get_local 6
            i32.const 1472
            i64.load align=4
            i64.store align=4
            get_local 6
            i32.const 1480
            i64.load align=4
            i64.store offset=8 align=4
            i32.const 1472
            get_local 1
            i32.store
            i32.const 1476
            get_local 3
            i32.store
            i32.const 1484
            i32.const 0
            i32.store
            i32.const 1480
            get_local 6
            i32.store
            get_local 5
            set_local 1
            loop  ;; label = @4
                get_local 1
                i32.const 4
                i32.add
                tee_local 3
                i32.const 7
                i32.store
                get_local 1
                i32.const 8
                i32.add
                get_local 8
                i32.lt_u
                if  ;; label = @5
                get_local 3
                set_local 1
                br 1 (;@4;)
                end
            end
            get_local 2
            get_local 4
            i32.ne
            if  ;; label = @4
                get_local 7
                get_local 7
                i32.load
                i32.const -2
                i32.and
                i32.store
                get_local 4
                get_local 2
                get_local 4
                i32.sub
                tee_local 7
                i32.const 1
                i32.or
                i32.store offset=4
                get_local 2
                get_local 7
                i32.store
                get_local 7
                i32.const 3
                i32.shr_u
                set_local 3
                get_local 7
                i32.const 256
                i32.lt_u
                if  ;; label = @5
                get_local 3
                i32.const 3
                i32.shl
                i32.const 1064
                i32.add
                set_local 1
                i32.const 1024
                i32.load
                tee_local 2
                i32.const 1
                get_local 3
                i32.shl
                tee_local 3
                i32.and
                if (result i32)  ;; label = @6
                    get_local 1
                    i32.const 8
                    i32.add
                    tee_local 2
                    i32.load
                else
                    i32.const 1024
                    get_local 2
                    get_local 3
                    i32.or
                    i32.store
                    get_local 1
                    i32.const 8
                    i32.add
                    set_local 2
                    get_local 1
                end
                set_local 3
                get_local 2
                get_local 4
                i32.store
                get_local 3
                get_local 4
                i32.store offset=12
                get_local 4
                get_local 3
                i32.store offset=8
                get_local 4
                get_local 1
                i32.store offset=12
                br 3 (;@2;)
                end
                get_local 7
                i32.const 8
                i32.shr_u
                tee_local 1
                if (result i32)  ;; label = @5
                get_local 7
                i32.const 16777215
                i32.gt_u
                if (result i32)  ;; label = @6
                    i32.const 31
                else
                    get_local 7
                    i32.const 14
                    get_local 1
                    get_local 1
                    i32.const 1048320
                    i32.add
                    i32.const 16
                    i32.shr_u
                    i32.const 8
                    i32.and
                    tee_local 1
                    i32.shl
                    tee_local 3
                    i32.const 520192
                    i32.add
                    i32.const 16
                    i32.shr_u
                    i32.const 4
                    i32.and
                    tee_local 2
                    get_local 1
                    i32.or
                    get_local 3
                    get_local 2
                    i32.shl
                    tee_local 1
                    i32.const 245760
                    i32.add
                    i32.const 16
                    i32.shr_u
                    i32.const 2
                    i32.and
                    tee_local 3
                    i32.or
                    i32.sub
                    get_local 1
                    get_local 3
                    i32.shl
                    i32.const 15
                    i32.shr_u
                    i32.add
                    tee_local 1
                    i32.const 7
                    i32.add
                    i32.shr_u
                    i32.const 1
                    i32.and
                    get_local 1
                    i32.const 1
                    i32.shl
                    i32.or
                end
                else
                i32.const 0
                end
                tee_local 3
                i32.const 2
                i32.shl
                i32.const 1328
                i32.add
                set_local 1
                get_local 4
                get_local 3
                i32.store offset=28
                get_local 4
                i32.const 0
                i32.store offset=20
                get_local 12
                i32.const 0
                i32.store
                i32.const 1028
                i32.load
                tee_local 2
                i32.const 1
                get_local 3
                i32.shl
                tee_local 5
                i32.and
                i32.eqz
                if  ;; label = @5
                i32.const 1028
                get_local 2
                get_local 5
                i32.or
                i32.store
                get_local 1
                get_local 4
                i32.store
                get_local 4
                get_local 1
                i32.store offset=24
                get_local 4
                get_local 4
                i32.store offset=12
                get_local 4
                get_local 4
                i32.store offset=8
                br 3 (;@2;)
                end
                get_local 1
                i32.load
                set_local 1
                i32.const 25
                get_local 3
                i32.const 1
                i32.shr_u
                i32.sub
                set_local 2
                get_local 7
                get_local 3
                i32.const 31
                i32.eq
                if (result i32)  ;; label = @5
                i32.const 0
                else
                get_local 2
                end
                i32.shl
                set_local 3
                block  ;; label = @5
                loop  ;; label = @6
                    get_local 1
                    i32.load offset=4
                    i32.const -8
                    i32.and
                    get_local 7
                    i32.eq
                    br_if 1 (;@5;)
                    get_local 3
                    i32.const 1
                    i32.shl
                    set_local 2
                    get_local 1
                    i32.const 16
                    i32.add
                    get_local 3
                    i32.const 31
                    i32.shr_u
                    i32.const 2
                    i32.shl
                    i32.add
                    tee_local 3
                    i32.load
                    tee_local 5
                    if  ;; label = @7
                    get_local 2
                    set_local 3
                    get_local 5
                    set_local 1
                    br 1 (;@6;)
                    end
                end
                get_local 3
                get_local 4
                i32.store
                get_local 4
                get_local 1
                i32.store offset=24
                get_local 4
                get_local 4
                i32.store offset=12
                get_local 4
                get_local 4
                i32.store offset=8
                br 3 (;@2;)
                end
                get_local 1
                i32.const 8
                i32.add
                tee_local 3
                i32.load
                tee_local 2
                get_local 4
                i32.store offset=12
                get_local 3
                get_local 4
                i32.store
                get_local 4
                get_local 2
                i32.store offset=8
                get_local 4
                get_local 1
                i32.store offset=12
                get_local 4
                i32.const 0
                i32.store offset=24
            end
            else
            i32.const 1040
            i32.load
            tee_local 2
            i32.eqz
            get_local 1
            get_local 2
            i32.lt_u
            i32.or
            if  ;; label = @4
                i32.const 1040
                get_local 1
                i32.store
            end
            i32.const 1472
            get_local 1
            i32.store
            i32.const 1476
            get_local 3
            i32.store
            i32.const 1484
            i32.const 0
            i32.store
            i32.const 1060
            i32.const 1496
            i32.load
            i32.store
            i32.const 1056
            i32.const -1
            i32.store
            i32.const 1076
            i32.const 1064
            i32.store
            i32.const 1072
            i32.const 1064
            i32.store
            i32.const 1084
            i32.const 1072
            i32.store
            i32.const 1080
            i32.const 1072
            i32.store
            i32.const 1092
            i32.const 1080
            i32.store
            i32.const 1088
            i32.const 1080
            i32.store
            i32.const 1100
            i32.const 1088
            i32.store
            i32.const 1096
            i32.const 1088
            i32.store
            i32.const 1108
            i32.const 1096
            i32.store
            i32.const 1104
            i32.const 1096
            i32.store
            i32.const 1116
            i32.const 1104
            i32.store
            i32.const 1112
            i32.const 1104
            i32.store
            i32.const 1124
            i32.const 1112
            i32.store
            i32.const 1120
            i32.const 1112
            i32.store
            i32.const 1132
            i32.const 1120
            i32.store
            i32.const 1128
            i32.const 1120
            i32.store
            i32.const 1140
            i32.const 1128
            i32.store
            i32.const 1136
            i32.const 1128
            i32.store
            i32.const 1148
            i32.const 1136
            i32.store
            i32.const 1144
            i32.const 1136
            i32.store
            i32.const 1156
            i32.const 1144
            i32.store
            i32.const 1152
            i32.const 1144
            i32.store
            i32.const 1164
            i32.const 1152
            i32.store
            i32.const 1160
            i32.const 1152
            i32.store
            i32.const 1172
            i32.const 1160
            i32.store
            i32.const 1168
            i32.const 1160
            i32.store
            i32.const 1180
            i32.const 1168
            i32.store
            i32.const 1176
            i32.const 1168
            i32.store
            i32.const 1188
            i32.const 1176
            i32.store
            i32.const 1184
            i32.const 1176
            i32.store
            i32.const 1196
            i32.const 1184
            i32.store
            i32.const 1192
            i32.const 1184
            i32.store
            i32.const 1204
            i32.const 1192
            i32.store
            i32.const 1200
            i32.const 1192
            i32.store
            i32.const 1212
            i32.const 1200
            i32.store
            i32.const 1208
            i32.const 1200
            i32.store
            i32.const 1220
            i32.const 1208
            i32.store
            i32.const 1216
            i32.const 1208
            i32.store
            i32.const 1228
            i32.const 1216
            i32.store
            i32.const 1224
            i32.const 1216
            i32.store
            i32.const 1236
            i32.const 1224
            i32.store
            i32.const 1232
            i32.const 1224
            i32.store
            i32.const 1244
            i32.const 1232
            i32.store
            i32.const 1240
            i32.const 1232
            i32.store
            i32.const 1252
            i32.const 1240
            i32.store
            i32.const 1248
            i32.const 1240
            i32.store
            i32.const 1260
            i32.const 1248
            i32.store
            i32.const 1256
            i32.const 1248
            i32.store
            i32.const 1268
            i32.const 1256
            i32.store
            i32.const 1264
            i32.const 1256
            i32.store
            i32.const 1276
            i32.const 1264
            i32.store
            i32.const 1272
            i32.const 1264
            i32.store
            i32.const 1284
            i32.const 1272
            i32.store
            i32.const 1280
            i32.const 1272
            i32.store
            i32.const 1292
            i32.const 1280
            i32.store
            i32.const 1288
            i32.const 1280
            i32.store
            i32.const 1300
            i32.const 1288
            i32.store
            i32.const 1296
            i32.const 1288
            i32.store
            i32.const 1308
            i32.const 1296
            i32.store
            i32.const 1304
            i32.const 1296
            i32.store
            i32.const 1316
            i32.const 1304
            i32.store
            i32.const 1312
            i32.const 1304
            i32.store
            i32.const 1324
            i32.const 1312
            i32.store
            i32.const 1320
            i32.const 1312
            i32.store
            get_local 3
            i32.const -40
            i32.add
            set_local 2
            i32.const 0
            get_local 1
            i32.const 8
            i32.add
            tee_local 5
            i32.sub
            i32.const 7
            i32.and
            set_local 3
            i32.const 1048
            get_local 1
            get_local 5
            i32.const 7
            i32.and
            if (result i32)  ;; label = @4
                get_local 3
            else
                i32.const 0
                tee_local 3
            end
            i32.add
            tee_local 5
            i32.store
            i32.const 1036
            get_local 2
            get_local 3
            i32.sub
            tee_local 3
            i32.store
            get_local 5
            get_local 3
            i32.const 1
            i32.or
            i32.store offset=4
            get_local 1
            get_local 2
            i32.add
            i32.const 40
            i32.store offset=4
            i32.const 1052
            i32.const 1512
            i32.load
            i32.store
            end
        end
        i32.const 1036
        i32.load
        tee_local 1
        get_local 0
        i32.gt_u
        if  ;; label = @2
            i32.const 1036
            get_local 1
            get_local 0
            i32.sub
            tee_local 3
            i32.store
            i32.const 1048
            i32.const 1048
            i32.load
            tee_local 1
            get_local 0
            i32.add
            tee_local 2
            i32.store
            get_local 2
            get_local 3
            i32.const 1
            i32.or
            i32.store offset=4
            get_local 1
            get_local 0
            i32.const 3
            i32.or
            i32.store offset=4
            get_local 10
            set_global  $STACKTOP
            get_local 1
            i32.const 8
            i32.add
            return
        end
        end
        i32.const 1520
        i32.const 12
        i32.store
        get_local 10
        set_global  $STACKTOP
        i32.const 0)
    (func $sbrk_02 (type $1) (param i32) (result i32)
        (local i32)
        get_local 0
        i32.const 0
        i32.gt_s
        get_global $DYNAMICTOP_PTR
        i32.load
        tee_local 1
        get_local 0
        i32.add
        tee_local 0
        get_local 1
        i32.lt_s
        i32.and
        get_local 0
        i32.const 0
        i32.lt_s
        i32.or
        if  ;; label = @1
            call $abortOnCannotGrowMemory
            drop
            i32.const 12
            call $___setErrNo
            i32.const -1
            return
        end
        get_global $DYNAMICTOP_PTR
        get_local 0
        i32.store
        get_local 0
        call $getTotalMemory
        i32.gt_s
        if  ;; label = @1
            call $enlargeMemory
            i32.eqz
            if  ;; label = @2
                get_global $DYNAMICTOP_PTR
                get_local 1
                i32.store
                i32.const 12
                call $___setErrNo
                i32.const -1
                return
            end
        end
        get_local 1)
)
