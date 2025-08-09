#include "sieve.h"
#include <stddef.h>
#include <stdbool.h>
#include <stdlib.h>
#include <malloc.h>

void initialize(bool *sv, uint32_t limit){
    uint32_t i;    
    for(i=0; i<limit; i++ ){
        sv[i] = true;
    }    
}


uint32_t sieve(uint32_t limit, uint32_t *primes, size_t max_primes){
           uint32_t n=2;
           uint32_t k;
           bool sieve[limit];
           initialize(sieve, limit);
           while(n <=limit) {
               for(k=n*n; k<=limit; k+=n){
                   sieve[k-1] = false;
               }
               while(!sieve[(++n)-1]);
            }
          n = 0;
          for(k=1; k<limit && n<max_primes ; k++){
                  if(sieve[k]) {
                      primes[n] = k+1;
                      n++;
                  } 
              }
         return n;  
}

