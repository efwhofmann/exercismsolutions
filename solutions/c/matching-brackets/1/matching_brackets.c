#include "matching_brackets.h"
#include <string.h>

bool left(char);
bool right(char);
bool complements(char, char);
bool well_formed(const char*);

bool left(char c){
       return (c=='(' || c=='[' || c=='{');
}

bool right(char c){
        return (c==')' || c==']' || c=='}');
}

bool complements(char l, char r){
        switch (l) {
            case '[':  return(r == ']');
            case '(':  return(r == ')');
            case '{':  return(r == '}');
            default: return false;
        }
}

bool well_formed(const char* input){
    int len = strlen(input);
    char stack[len/2];
    memset(stack, 0, sizeof(stack));
    int s_pos = 0;    
    for(int i = 0; i<len; i++){
       char ch =  input[i];
       if (left( ch) ){
               stack[s_pos] = ch; 
               s_pos ++;
        }
        else if (right( ch)){
                if (0 == s_pos)
                    return false;
                s_pos--;
                char c = stack[s_pos];
                if (!complements(c, ch))
                    return false;
                else {
                    stack[s_pos] = 0;                    
                }
        }    
    } 
    return (0== s_pos);
}


bool is_paired(const char *input){
        int len = strlen(input);
        if (len<2)
            return (0==len);
        else     
            return well_formed(input);
}
