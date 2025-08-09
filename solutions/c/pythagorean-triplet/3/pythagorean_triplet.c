#include "pythagorean_triplet.h"

#include <stdint.h>
#include <string.h>
#include <malloc.h>


triplets_t *triplets_with_sum(uint16_t sum){
    triplet_t buffer[100];
    triplets_t *result = (triplets_t*)calloc(1,sizeof(triplets_t)); 
    uint16_t count = 0;
    for(uint16_t a=1; a<sum/3; a++) {
        uint32_t numerator = a*a + (sum-a)*(sum-a);
        uint32_t denom = 2*(sum-a);
        if(0 == numerator % denom) {
            uint16_t c = (uint16_t) (numerator/denom);
            uint16_t b = sum - a - c;
            if(b>a) {
                triplet_t tri = {.a = a, .b=b, .c=c};
                buffer[count++] = tri;
            }                
        }
    }
    result->count = count;
    result->triplets = (triplet_t*) calloc(count, sizeof(triplet_t));
    for(unsigned int i=0; i<count; i++){
        result->triplets[i] = buffer[i];
    }
    return result;
}
void free_triplets(triplets_t *triplets) {
    free(triplets);
}