#include "prime_factors.h"

size_t find_factors(uint64_t n, uint64_t factors[static MAXFACTORS]){
    size_t idx=0;
    for(uint64_t k=2; k<=n/2; k++)
            while(!(n % k)){
                factors[idx] = k;
                idx++;
                n /= k;
                }
        if (n>1) {
            factors[idx] = n;
            idx++;
        }
        return idx;
       }
    

