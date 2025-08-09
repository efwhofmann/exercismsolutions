#include "reverse_string.h"

#include <string.h>
#include <malloc.h>

char *reverse(const char *phrase){
    unsigned int length = strlen(phrase);
    char* reverse = (char*)calloc(strlen(phrase), sizeof(char));
    for (unsigned int i=0; i<length; i++)
        reverse[length-1-i] = phrase[i];
    return reverse;
}