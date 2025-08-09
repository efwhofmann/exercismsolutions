#include "crypto_square.h"
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <math.h>

char *ciphertext(const char *input){
    size_t in_len = strlen(input);
    char buffer[in_len];
    memset(buffer, 0, sizeof(buffer));
    size_t len = 0;
    for(const char* p = input; *p; p++){
        if(isalnum(*p)){
            buffer[len] = isalpha(*p) ? tolower(*p) : *p;
            len++;
        }        
    }
    unsigned int cols = (int)ceil(sqrt(len));
    unsigned int rows = cols*(cols-1) >= len ? cols-1 : cols;
    unsigned int padding = cols*rows - len;

    char* output = calloc(cols*rows+cols-1,sizeof(char));
    if(NULL==output)
        return calloc(1,1); // returns char* to ''
    size_t count = 0;
    for(unsigned int i=0; i<cols; i++){
        for(unsigned int j=0; j<rows; j++){
            unsigned int idx = j*cols + i;
            if(idx < len)
                output[count++] = buffer[idx];
           }
        if(i>=cols-padding) output[count++] = ' ';
        if(cols>0 && i<cols-1) output[count++] = ' ';
    }
    return output;
    
}
