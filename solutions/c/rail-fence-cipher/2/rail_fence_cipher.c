#include "rail_fence_cipher.h"

#include <string.h>
#include <malloc.h>
#include <stdbool.h>
#define STEP_NEXT(step, max) (step == max ? max : max - step)

typedef enum modeType_t {ENCODE, DECODE} modeType;

char *encode_decode(char*, size_t, const modeType);


char *encode(char *text, size_t rails){
    return encode_decode(text, rails, ENCODE);
}

char *decode(char *ciphertext, size_t rails){
    return encode_decode(ciphertext, rails, DECODE);
}

char *encode_decode(char *input, size_t rails, const modeType mode){
    const size_t len = strlen(input);
    const size_t max_step = 2*(rails - 1);
    char *output = (char*)calloc(len, sizeof(char));
    size_t pos_ciph = 0;
    for(size_t rail = 0; rail<rails; ++rail){
         size_t step = ( 0==rail ) ? max_step : 2*rail;
         for(size_t pos_text = rail; pos_text <len; 
              step = STEP_NEXT(step, max_step),   
                 pos_text += step, ++pos_ciph ){             
                    if(mode == ENCODE) 
                         output[pos_ciph] = input[pos_text];   
                    else
                         output[pos_text] = input[pos_ciph];
         }             
    }
    return output;    
}
