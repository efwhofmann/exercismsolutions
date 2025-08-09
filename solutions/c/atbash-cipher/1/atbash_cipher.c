#include "atbash_cipher.h"
#include <string.h>
#include <malloc.h>
#include <stdbool.h>
#include <ctype.h>

char *cipher(const char* input, bool is_encoding);

char *cipher(const char* input, bool is_encoding){
    size_t len = strlen(input);
    char buffer[len + len/5];
    size_t idx=0;
    size_t count=0;
    for(size_t i=0; i<len; i++) {
        char ch = tolower(input[i]);
        if (isalnum(input[i])) {
            if(isdigit(ch))
                buffer[idx] = ch;
            else 
                buffer[idx] = 'z' - (ch - 'a');
            idx++;
            count++;
            if(is_encoding && idx>0 && (0 == count % 5)) {
                buffer[idx++] = ' ';
                count = 0;
             }
            }
        }
    if(buffer[idx-1] == ' ')
        idx--;
     char *result = calloc(idx, sizeof(char));
     strncpy(result, buffer, idx);
     return result;
}

char *atbash_encode(const char *input){
    return cipher(input, true);
}

char *atbash_decode(const char *input){
    return cipher(input, false);
}
