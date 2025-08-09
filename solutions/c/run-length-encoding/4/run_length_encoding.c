#include "run_length_encoding.h"
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <stdio.h>


void output_term(char p, int n, char *out){
    char tmp[12]={0};
    if(n>1) {
        sprintf(tmp, "%d%c", n, p);}
    else
        sprintf(tmp, "%c", p);
    strcat(out, tmp);    
}

char* encode(const char *text){
    unsigned int len = strlen(text);
    char buffer[len];
    memset(buffer, 0, len);
    int count=0;
    char p=0;
    for(unsigned int i=0; i<len; i++){
       char c= text[i];
       if(p==c) {
            count++;
        }        
        else {
            if(p)
                output_term(p,count,buffer);
            count = 1;
            p = c;           
        }
    }    
    if(p)
        output_term(p,count,buffer);
    char *result = calloc(strlen(buffer), 1);
    strcat(result, buffer);  
    return result;
}

char* decode(const char* data){
    char buff[200] = {0};
    
    int digit_count = 0;
    for(unsigned int i=0; i<strlen(data); i++){
        char c = data[i];
        if(isdigit(c)){
            if(digit_count>0)
                digit_count = 10*digit_count + (c - '0');
            else 
                digit_count = c - '0';
        } else {
            char tmp[2]={(char)c,'\0'};
            strcat(buff,tmp);
            for(int j=0; j<digit_count-1; j++)
                strcat(buff, tmp);
            digit_count = 0;
        }
    }
    
    char *result = calloc(strlen(buff), sizeof(char));
    strcat(result, buff);
    return result;
}
