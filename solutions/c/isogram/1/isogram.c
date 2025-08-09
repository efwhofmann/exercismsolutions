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
        int idx = 0;
        if(c>= 'a' && c<='z')
            idx = c-96;
        else if(c>= 'A' && c<='Z')
            idx = c-64;
        if (idx>0){   
            if(!found_letter[idx-1])
                found_letter[idx-1] = true; 
            else {
                 is_isogram = false;
                 break;
            }}
        }            
    return is_isogram;
}

