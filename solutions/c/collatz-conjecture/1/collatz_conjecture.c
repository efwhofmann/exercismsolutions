#include "collatz_conjecture.h"


int steps (int start){
    int n = start;
    int steps = 0;
    if(n<1)
        return ERROR_VALUE;
    while(n>1) {
        n = (n % 2 == 0) ? n/2 : 3*n +1;
        steps++;    
    }
    return steps;
}