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
    char *buffer = (char*)calloc(len, sizeof(char));
    state_t state = SPACE;
    for(size_t i=0; i<len; i++){
        char ch = phrase[i];
        switch(state) {
            case SPACE:
                if(ch == ' ' || ch == '_' || ch == '-')
                    state = SPACE;
                 else if ('A'<=ch && ch<='Z'){
                    INSERT(buffer, count, ch)
                    state = CAPITAL;}
                 else if ('a'<=ch && ch<='z'){
                    INSERT(buffer, count, ch-'a'+'A')
                    state = CONSUME;}
                break; 
            case CAPITAL:
                if(ch == ' ' || ch == '-' || ch == '_')
                    state = SPACE;                    
                else if('A'<=ch && ch <='Z')
                    state = CAPITAL;
                else 
                    state = CONSUME;                
                break;   
            case CONSUME:
                if(ch == ' ' || ch == '-' || ch == '_')
                    state = SPACE; 
                 else if('A'<=ch && ch <='Z'){
                     INSERT(buffer, count, ch)
                     state = CAPITAL;
                 }
                break;
        }        
    }
    char *abbrev = (char*)calloc(count, sizeof(char));
    strncpy(abbrev, buffer, count);
    memset(buffer, 0, len*sizeof(char));
    buffer = NULL;
    return abbrev;
}