#include "nth_prime.h"
#include <cmath>
#include <stdexcept>
#include <vector>
using namespace std;

namespace nth_prime {

int nth(unsigned int n){
    if(n<1){
        throw std::domain_error("Number must be >=1.");
    } 
    vector<int>  primes={2};
    int candidate = 3;
    while(primes.size()<n){ 
            bool is_prime = true;
            for(auto it =primes.begin(); it!=primes.end(); ++it){
                is_prime = is_prime && (candidate % *it !=0);
            } 
            if (is_prime) 
                primes.push_back(candidate);
           candidate += 2;
        }        
        return primes.back();
    }


}  // namespace nth_prime
