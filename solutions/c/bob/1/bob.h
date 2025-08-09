#ifndef BOB_H
#define BOB_H
#include <stdbool.h>

bool is_question(char* input);
bool is_silence(char* input);
bool is_shouting(char* input);
    
char *hey_bob(char *greeting);

#endif
