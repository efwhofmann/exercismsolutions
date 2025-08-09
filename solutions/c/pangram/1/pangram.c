#include "pangram.h"
#include <string.h>



bool is_pangram(const char *sentence){
    if(!sentence)
        return false;
    size_t len = strlen(sentence);
    if(0==len) 
        return false;
    bool can_be_pangram = true;
    for(int i=0; i<26; i++){
        bool contains_letter = false;
        for(size_t j=0; j<len; j++){
            if(sentence[j] == 'a' + i || sentence[j] == 'A' +i ){
                contains_letter = true;
                break;
            }
        }
        if(!(can_be_pangram = contains_letter && can_be_pangram))
            break;        
    }   
    return can_be_pangram;    
}