#include "hamming.h"
#include <string.h>

int compute(const char *lhs, const char *rhs){
    unsigned int len_l = strlen(lhs);
    if(strlen(rhs)!=len_l)
        return -1;
    int sum = 0;
    for(unsigned int i=0; i<len_l; i++)
        sum += lhs[i]!=rhs[i] ? 1 : 0;
    return sum;    
}

