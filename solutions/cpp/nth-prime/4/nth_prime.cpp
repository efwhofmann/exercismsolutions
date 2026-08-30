#include "nth_prime.h"
#include <stdexcept>
#include <vector>
#include <algorithm>


namespace nth_prime {

int nth(unsigned int n){
    if(n<1){
        throw std::domain_error("Number must be >=1.");
    } 
    std::vector<int>  primes={2};
    int candidate = 3;
    while(primes.size()<n){ 
            if(std::none_of(primes.begin(), primes.end(),
                [candidate](int p){return candidate % p  == 0;})){
                    primes.push_back(candidate);    
                }
           candidate += 2;
        }        
        return primes.back();
    }


}  // namespace nth_prime
