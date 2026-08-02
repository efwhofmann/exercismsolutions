#include "etl.h"
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

int map_comp(const void* one, const void* two);

int convert(const legacy_map *input, const size_t input_len, new_map **output){
    int length = 0;
    for(size_t i = 0; i<input_len; i++){
        length += strlen(input[i].keys);
    }
    (*output) = (new_map*)calloc(length, sizeof(new_map));
    int k=0;
    for(size_t i=0; i<input_len; i++){
        for(size_t j=0; j<strlen(input[i].keys);j++){
            (*output)[k].key =  tolower(input[i].keys[j]);
            (*output)[k].value = input[i].value;
            k++;
        }
    }
    qsort(*output, length, sizeof(new_map),map_comp);
    return length;
}

int map_comp(const void* one, const void* two){
    return ((new_map*) one)->key > ((new_map*) two)->key ?
        1 : ((new_map*) one)->key < ((new_map*) two)->key ?
            -1 : 0;
}

