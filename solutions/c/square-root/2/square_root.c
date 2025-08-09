#include "square_root.h"

#include <stdint.h>
#include <math.h>

uint16_t square_root(uint16_t n) {
    double x = 0.75*n;
    while (floor(x) * floor(x) != n) {
        x  = 0.5*(x + n/x);
    }
    return floor(x);
}