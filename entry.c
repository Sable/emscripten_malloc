#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv){

    int *ptr;
    for(int i = 0;i< 10;i++){
        ptr = (int *)malloc(sizeof(int)*1000000);
        ptr[i] = i+10;
    }    
    int b = ptr[9];
    free(ptr);
    return b;
}
