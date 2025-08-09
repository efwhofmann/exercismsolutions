#include "bob.h"

#include<string.h>
#include<ctype.h>

bool is_question(char* input){
    int count = strlen(input)-1;
    bool q = false;    
    while(count>=0 && isspace(input[count])){
        count--;
    }
    if(count>=0) q = q || input[count]=='?';
    return q;      
}

bool is_shouting(char* input){
    bool caps = true;
    bool has_letters = false;
    for(size_t i=0; i<strlen(input); i++){        
        caps = isalpha(input[i]) ? caps && isupper(input[i]) : caps;
        if(!has_letters && isalpha(input[i])) has_letters = true;
    }
    return has_letters && caps;
}

bool is_silence(char* input){
    bool silence = true;
    for(size_t i=0; i<strlen(input); i++){
        silence = silence && isspace(input[i]);
    } 
    return silence;
}

char *hey_bob(char *greeting){
    char *res;
    if (is_silence(greeting)){
        res = "Fine. Be that way!";} 
    else if (is_question(greeting)) {
        if(is_shouting(greeting)) { res = "Calm down, I know what I'm doing!"; }
        else { res = "Sure.";} }
    else if (is_shouting(greeting)){ 
        res="Whoa, chill out!";}
    else { res="Whatever.";}
   return res;
}


