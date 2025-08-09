#include "all_your_base.h"

bool is_valid(int8_t*, int8_t, size_t );
int digits_to_num(int8_t*, int8_t, size_t );
size_t num_to_digits(int8_t*, size_t, int, int8_t);

bool is_valid(int8_t *dgts, int8_t a, size_t len){
    for(size_t i=0; i<len; i++){
        if (dgts[i]>=a || dgts[i]<0) 
            return false;
    }            
    return true;
}

int digits_to_num(int8_t *dgts, int8_t a, size_t len){
    int num = 0;
    int ap = 1;
    for(size_t i=len; i>=1; i--){
        num += dgts[i-1] * ap;
        ap *= a;
    }
    return num;
}

size_t num_to_digits(int8_t *dgts, size_t len, int num, int8_t b){
    int buff[DIGITS_ARRAY_SIZE] = {0};    
    for(size_t i=0; i<len; i++)
        dgts[i] = 0;   
    if(0==num)
        return 1;
    size_t idx = 0;
    while(num>0) {
        buff[idx] = num%b;
        num = num/b;
        idx++;
    }
    for(size_t j=idx; j>=1; j--)
        dgts[j-1] = buff[idx-j];
    return idx;
}


size_t rebase(int8_t *digits, int8_t a, int8_t b, size_t len){
    if((len>0) && (a>1) && (b>1) && is_valid(digits, a, len)){
        int number = digits_to_num(digits, a, len);
        return num_to_digits(digits, len, number, b);
    }
   else
        return 0;    
}


