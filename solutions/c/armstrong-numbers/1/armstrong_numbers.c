#include "armstrong_numbers.h"
#include <string.h>
#include <stdio.h>
#include <math.h>

bool is_armstrong_number(int candidate){
    char buffer[8] = {0};
    sprintf(buffer, "%d", candidate);
    int n = strlen(buffer);
    int sum = 0;
    for(int i=0; i<n; i++){
        sum += (int)pow((buffer[i] - '0'), n);        
    }
    return sum==candidate;
}