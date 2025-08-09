#include "isogram.h"
#include <string.h>

bool is_isogram(const char phrase[]){

    if(!phrase)
        return false;
    size_t len = strlen(phrase);
    bool found_letter[26] = {0};
    bool is_isogram = true;

    if(0==len)
        return is_isogram;
    for(size_t i=0; i<len; i++){
        char c = phrase[i];
        if((c>='A' && c<='Z')|| (c>='a' && c<='z')){
            size_t idx = c<='Z' ? c-'A' : c-'a'; 
            if(!found_letter[idx])
                found_letter[idx] = true; 
            else {
                 is_isogram = false;
                 break;
            }}
        }            
    return is_isogram;
}

