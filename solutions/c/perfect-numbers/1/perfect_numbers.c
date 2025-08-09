#include "perfect_numbers.h"

int alliquot_sum(int);

int alliquot_sum(int n) {
    int sum = 1;
    for (int k=2; k<= n/2; k++) {
        if (n%k == 0) 
            sum += k;
    }
    return sum;
}

kind classify_number(int n){
     kind result = ERROR;
     int asum;
     if (n<=1)
        return (n==1) ? result = DEFICIENT_NUMBER : result;
    
     asum = alliquot_sum(n);
     if (asum > n) 
         result = ABUNDANT_NUMBER;
     else 
         result = (asum == n) ? PERFECT_NUMBER : DEFICIENT_NUMBER;
     return result;  
}
