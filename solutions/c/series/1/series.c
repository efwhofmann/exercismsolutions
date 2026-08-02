#include "series.h"
#include <string.h>
#include <stdlib.h>

slices_t slices(char *input_text, unsigned int len){
    unsigned int max = strlen(input_text);
    if(len == 0 || len > max){
      return (slices_t){0, NULL};
    }  
    unsigned int num_slices = max - len+1;
    slices_t output = {num_slices, 
        calloc(num_slices, sizeof(char*))};
    for(unsigned int i=0; i<num_slices; i++){
        output.substring[i] = calloc(len, sizeof(char));
        strncpy(output.substring[i], &input_text[i], len);
    }
    return output;
}