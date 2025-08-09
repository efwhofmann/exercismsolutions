#include "resistor_color_duo.h"


uint16_t single_code(resistor_band_t color){
    return (uint16_t) color;    
}

uint16_t color_code(resistor_band_t colors[]){
    return (10*single_code(colors[0]) +     single_code(colors[1]));
}
