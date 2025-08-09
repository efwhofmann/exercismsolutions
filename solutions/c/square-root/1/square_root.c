#include "square_root.h"

#include <stdint.h>
#include <math.h>

uint16_t square_root(uint16_t n) {
    double x = 0.75*n;
    for(int i = 0; i<10; i++){
        x  = 0.5 *(x + n/x);
    }
    return floor(x);
}