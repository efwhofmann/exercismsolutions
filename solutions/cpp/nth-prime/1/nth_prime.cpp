#include "nth_prime.h"
#include <cmath>
#include <stdexcept>


namespace nth_prime {

int nth(int N){
    if(N<1){
        throw std::domain_error("Number must be >=1.");
    } else {
        if (N==1) 
            return 2; 
        int count = 2;
        int candidate = 3;
        while(count != N){
           candidate += 2;
            bool is_prime = true;
            for(int i = 3; i<= round(sqrt(candidate));i+=2){
             if (!(candidate % i)) {
                  is_prime = false;
                  break;
              }               
             }  
           if (is_prime)
                 count++;
           }
        return candidate;
    }
}

}  // namespace nth_prime
