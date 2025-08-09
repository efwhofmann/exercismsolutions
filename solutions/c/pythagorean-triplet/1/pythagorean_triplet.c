#include "pythagorean_triplet.h"

#include <stdint.h>
#include <string.h>
#include <malloc.h>


triplets_t *triplets_with_sum(uint16_t sum){
    triplet_t buffer[100];
    triplets_t *result = (triplets_t*)calloc(1,sizeof(triplets_t)); 
    uint16_t count = 0;
    unsigned int sq = sum*sum;
    unsigned int bound =  sq/(2*(sum+1));
    for(uint16_t b=2; b<=bound; b++) {
         for(uint16_t a=1; a<b; a++) {
             // calculate N^2 - 2(a+b)N +2ab
             int lhs = sq - 2*(a+b)*sum +2*a*b;
             if (0==lhs) {
                 uint16_t c= sum-a-b;
                 triplet_t tri = {.a=a,.b=b,.c=c};
                 buffer[count++] = tri;   
              } else if (lhs<0) 
                 break;
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