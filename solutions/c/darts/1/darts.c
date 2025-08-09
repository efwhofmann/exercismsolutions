#include "darts.h"
#include <math.h>

#define NO_CIRCLES 3

uint8_t score(coordinate_t landing) {
    double radius = sqrt(landing[0]*landing[0] + landing[1]*landing[1]);     int scores[] = {0,1,5,10};    
    int radii_target[] = {1,5,10}; 
    int the_score = 0;
    for (unsigned int i=0; i<NO_CIRCLES; i++) {
        if(radius<=radii_target[i]){
            the_score = scores[NO_CIRCLES-i];
            break;
        }
    }
    return the_score;
}
