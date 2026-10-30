#include "sum_of_multiples.h"
#include <stdbool.h>
#include <stdio.h>


unsigned int sum(const unsigned int *factors, const size_t number_of_factors,
                 const unsigned int limit){
    unsigned int result = 0;
    for(unsigned int m=1; m<limit; m++){
        bool is_multiple = false;
        for(unsigned int i=0; i<number_of_factors; i++){
            unsigned int f = factors[i]; 
            if(f!=0 && (m % f == 0)){
                is_multiple = true;
                break;
           }
        } 
        if(is_multiple)
            result += m;
    }
    return result;
}
