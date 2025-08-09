#include "two_fer.h"
#include <string.h>
#include <stdio.h>


void two_fer(char *buffer, const char *name){
    const char *str1 = "One for ";
    const char *str3 =", one for me.";
    const char *str2 = !name || strlen(name)==0 ? "you" : name;
    sprintf(buffer, "%s%s%s", str1, str2, str3);
}

