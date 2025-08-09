#include "rotational_cipher.h"

#include <stdlib.h>
#include <string.h>

char* rotate(const char* text, int key) {
        int len = strlen(text);
        char* out = calloc(len+1, sizeof(char));
        for(int i=0; i<len; ++i){
            if (text[i]>='A' && text[i]<='Z'){
                out[i] = text[i] + key <='Z' ? text[i] + key : text[i] + key - 26;  
            }
            else if (text[i]>='a' && text[i]<='z'){
                out[i] = text[i] + key <='z' ? text[i] + key : text[i] +key - 26;  
            }
            else
                 out[i] = text[i];
        }
        return out;
}