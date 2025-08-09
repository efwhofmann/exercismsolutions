#include "binary.h"

#include<string.h>

int convert(const char* input){
    int len = strlen(input);
    int sum = 0;
    for(int i = 0; i<len; i++){
            sum *=2;
            if(input[i]>='0' && input[i]<='1')
                sum += input[i] - '0';
            else  
                return INVALID;
    }    
    return sum;
}

