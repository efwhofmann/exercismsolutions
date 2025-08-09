#include "raindrops.h"
#include <string.h>
#include <stdio.h>

void convert(char result[], int drops){
    if (drops%3==0)
        strcat(result, "Pling");
    if(drops%5==0)
        strcat(result, "Plang");
    if(drops%7==0)
        strcat(result, "Plong");
    if (!strlen(result))
        sprintf(result, "%d", drops);     
}