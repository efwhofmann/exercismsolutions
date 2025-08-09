#include "nth_prime.h"

#include<malloc.h>
#include<stdbool.h>

uint32_t nth(uint32_t n) {
    if(n<1)
        return 0;
    uint32_t *primes = (uint32_t*)calloc(n, sizeof(uint32_t));
    if(n<3) 
        return n==1 ? 2 : 3;
    primes[0] = 2; primes[1] = 3;
    uint32_t idx = 2;
    for(uint32_t cand=5; idx<n; cand=cand+2){
        bool is_prime = true;
        for(uint32_t j=1; j<idx; j++){
            if(!(cand % primes[j])) {
                is_prime = false;
                break;
            }
        }
        if(is_prime) {
            primes[idx] = cand;
            idx++;
        }
      }
      uint32_t result = primes[n-1];
      free(primes);
      return result;  
    
}