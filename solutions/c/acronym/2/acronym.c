#include "acronym.h"

#include <string.h>
#include <malloc.h>

typedef enum state_t {
    SPACE,
    CAPITAL,
    CONSUME
} state_t;

#define INSERT(buff,k,c) buff[k]=c; k++;

char *abbreviate(const char *phrase){
    if (!phrase)
        return NULL;
    const size_t len = strlen(phrase);
    size_t count = 0;
    if (!len)
        return NULL;
    char *abbrev = (char*)calloc(len, sizeof(char));
    state_t state = SPACE;
    for(size_t i=0; i<len; i++){
        char ch = phrase[i];
        if (ch == ' ' || ch == '_' || ch == '-'){
            state = SPACE;
        } 
        else if(ch>='A' && ch <= 'Z'){
            if(state == CONSUME || state == SPACE){
                INSERT(abbrev, count, ch)}
            state = CAPITAL;    
        }
        else if(ch>='a' && ch <= 'z'){
            if(state == SPACE) {
                INSERT(abbrev, count, ch-'a'+'A')
                }
            state = CONSUME;
        }
     }
    return abbrev;
}