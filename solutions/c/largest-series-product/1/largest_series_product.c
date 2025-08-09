#include "largest_series_product.h"

#include <string.h>
#include <ctype.h>

int64_t largest_series_product(char *digits, size_t span){
    size_t len = strlen(digits);
    if(span > len || (len == 0 && span >0)) {
        return -1;
    }
    int64_t max=0;
    for(size_t i=0; i<=len-span; i++){
        int64_t current = 1;
        for(size_t j=i; j<i+span; j++){
            if(!isdigit(digits[j]))
                return -1;
            current *= (digits[j] - '0');
        }
        max = current>max ? current : max;
    }
    return max;    
}

