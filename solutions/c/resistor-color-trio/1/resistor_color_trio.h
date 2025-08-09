#ifndef RESISTOR_COLOR_TRIO_H
#define RESISTOR_COLOR_TRIO_H
#include <stdint.h>

typedef enum {
    BLACK, 
    BROWN, 
    RED,
    ORANGE,
    YELLOW,  
    GREEN, 
    BLUE,  
    VIOLET, 
    GREY,   
    WHITE
} resistor_band_t;

typedef enum {
    OHMS = 0,
    KILOOHMS = 1,
    MEGAOHMS = 2,
    GIGAOHMS = 3
} ohm_units_t;

typedef struct resistor_value_t {
    uint16_t  value;
    ohm_units_t unit;    
} resistor_value_t;

uint16_t single_code(resistor_band_t color);
resistor_value_t color_code(resistor_band_t[]);


#endif
