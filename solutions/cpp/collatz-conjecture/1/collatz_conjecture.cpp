#include "collatz_conjecture.h"
#include<stdexcept>

namespace collatz_conjecture {

    unsigned int collatz_map(unsigned int num){
        int N;
        if (!(num % 2)) 
            N = num/2;
        else 
            N = 3*num + 1;
        return N;
    }

    int steps(int num){
        int counter = 0;
        if (num<=0)
            throw std::domain_error("Number must be strictly postive.");
        while(num > 1){
            num = collatz_map(num);
            counter++;
        }
        return counter;    
        
    }
}  // namespace collatz_conjecture
