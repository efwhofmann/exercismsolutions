#include "rail_fence_cipher.h"

#include <string.h>
#include <malloc.h>
#include <stdbool.h>

char *encode(char *text, size_t rails){
    const size_t len = strlen(text);
    const size_t max_step = 2*(rails - 1);
    char *ciphertext = (char*)calloc(len+1, sizeof(char));
    size_t dest = 0;
    for(size_t rail = 0; rail<rails; ++rail){
         size_t step = ( 0==rail ) ? max_step : 2*rail;
         for(size_t text_pos = rail; text_pos <len; 
              step = (max_step == step) ? max_step : max_step - step,   
             text_pos += step, ++dest ){             
              ciphertext[dest] = text[text_pos];   
         }             
    }
    return ciphertext;
}

char *decode(char *ciphertext, size_t rails){
    const size_t len = strlen(ciphertext);
    const size_t max_step = 2*(rails - 1);
    char *cleartext = (char*)calloc(len+1, sizeof(char));
    size_t dest = 0;
    for(size_t rail = 0; rail<rails; ++rail){
         size_t step = ( 0==rail ) ? max_step : 2*rail;
         for(size_t text_pos = rail; text_pos <len; 
              step = (max_step == step) ? max_step : max_step - step,   
             text_pos += step, ++dest ){             
               cleartext[text_pos] = ciphertext[dest];   
         }             
    }
    return cleartext;
}
