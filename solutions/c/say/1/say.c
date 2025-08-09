#include "say.h"

#include <stdint.h>
#include <string.h>
#include <stdlib.h>

#define MAXLENGTH 200
#define TRILLION (1000000000000l)

static const int64_t powers[] = {1000000000, 1000000,1000};

static const char* power_names[] = {"billion","million", "thousand", "hundred"};
static const char* tens[] = {"twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"};
static const char* teens[] = {"ten", "eleven", "twelve", "thireen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"};
static const char* ones[] = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine"};

 int parse_ones(int64_t number, char** ans) {
        if(number>=1 || number<=9)
            strcat(*ans, ones[number-1]);
        return 0;
    }    

int parse_tens(int64_t number, char** ans) {
        int64_t d = number/10;
        int64_t r = number%10;
        switch(d) {
            case 0: return (parse_ones(r, ans));
                    break;
            case 1: strcat(*ans, teens[r]);
                    break;
            default:
                strcat(*ans, tens[d-2]);
                if(r!=0) {   
                    strcat(*ans, "-");
                    return(parse_ones(r,ans));  
                } 
                break;
        }
        return 0;
    }

 int parse_hundreds(int64_t number, char** ans) {      
        int64_t d = number/100;
        int64_t r = number%100;
        if(!d) 
            return parse_tens(r,ans);
        else 
            {
                parse_ones(d, ans);
                strcat(*ans, " ");
                strcat(*ans, power_names[3]);
                if (r) {
                    strcat(*ans, " ");
                    return parse_tens(r,ans);
                } else 
                    return 0;
        }
 }     
               
           

int say(int64_t input, char **ans){
    if(input<0 || input>=TRILLION)
        return -1;
    if(input==0){
        *ans = calloc(strlen("zero"), 1);
        strcpy(*ans, "zero");        
        return 0;
        }
        
    *ans = calloc(MAXLENGTH, sizeof(char));
    for(int i = 0; i<4 &&  input>0; i++) {
            int64_t r = input / powers[i]; 
            if (r>0) {
                parse_hundreds(r, ans);
                strcat(*ans, " ");
                strcat(*ans, power_names[i]); 
                
            }         
            input = input % powers[i]; 
            if(r>0 && input>0)
                    strcat(*ans, " ");
        }   
    if(input>0) 
        parse_hundreds(input, ans);
    return 0;
}
