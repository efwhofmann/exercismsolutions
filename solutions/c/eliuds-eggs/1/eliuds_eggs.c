#include "eliuds_eggs.h"

unsigned int egg_count(unsigned int number){
    unsigned int sum = 0;
    while(number>0){
        sum += (number & 1);
        number = number >> 1;
    }
    return sum;
}

