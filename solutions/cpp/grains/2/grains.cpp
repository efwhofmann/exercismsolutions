#include "grains.h"

#include <cmath>

namespace grains {
    unsigned long int square(int sq){
        return sq>0 ? 1L << (sq-1) : 0;
    }

    unsigned long int total(){
       return ~0L; 
    }
}  // namespace grains
