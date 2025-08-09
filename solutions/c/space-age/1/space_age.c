#include "space_age.h"

const float relative_period[8] = {0.2408467, 0.61519726, 1.0, 1.8808158, 11.862615, 29.447498, 84.016846, 164.79132};

const int64_t earth_year = 31557600;

float age(planet_t planet, int64_t seconds){
    float rel_period = relative_period[(int)planet];
    if(rel_period == 0.0)
        return -1;
    return  seconds/(rel_period * earth_year); 
}
