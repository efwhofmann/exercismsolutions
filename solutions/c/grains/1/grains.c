#include "grains.h"

uint64_t square(uint8_t square)
{
    return (square>0 && square<65)? 1ull << (square - 1ull) : 0ull;    
}

uint64_t total(void){
    return ~0ull;
}
