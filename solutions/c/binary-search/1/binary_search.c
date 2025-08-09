#include "binary_search.h"

const int *binary_search(int value, const int *arr, size_t length){
    size_t left = 0;
    size_t right = length - 1;
    if (!length || value < arr[left] || value > arr[right])
        return NULL;
    else 
        while (left<= right) {
            size_t mid = (right+left)/2; 
            int v = arr[mid];
            if(v == value ) 
                return (const int *)(arr + mid);
            else if (v >value) 
                right = mid - 1;
            else 
                left = mid +1;           
            }
    return NULL;
}

