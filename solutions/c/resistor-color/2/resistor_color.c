#include "resistor_color.h"

#include<malloc.h>

resistor_band_t color_array[] = {BLACK,  BROWN,  RED,  ORANGE,  YELLOW, GREEN, BLUE, VIOLET, GREY, WHITE};

uint16_t color_code(resistor_band_t color){
    return (uint16_t) color;    
}
const resistor_band_t *colors(){
    return color_array;
}
