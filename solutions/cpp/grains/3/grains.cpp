#include "grains.h"

#include <cmath>

namespace grains {
    unsigned long square(int sq){
        return sq>0 ? 1L << (sq-1) : 0;
    }

    unsigned long total(){
       return ~0L; 
    }
}  // namespace grains
