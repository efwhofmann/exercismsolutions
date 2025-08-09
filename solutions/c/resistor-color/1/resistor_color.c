#include "resistor_color.h"

#include<malloc.h>

uint16_t color_code(resistor_band_t color){
    return (uint16_t) color;    
}
const resistor_band_t *colors(){
    resistor_band_t *result = (resistor_band_t*) calloc(10, sizeof(resistor_band_t)); 
    for (unsigned int i=0; i<10; i++)
        result[i] = (resistor_band_t)i;
    return result;
}
