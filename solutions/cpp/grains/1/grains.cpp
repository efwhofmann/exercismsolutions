#include "grains.h"

#include <cmath>

namespace grains {
    unsigned long int square(int sq){
        if (sq<=0) 
            return 0;
        else 
            return exp2(sq-1);        
    }

    unsigned long int total(){
       return (exp2(64) - 1.02L); 
    }
}  // namespace grains
