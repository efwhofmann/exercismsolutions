#include "resistor_color_trio.h"
#include <stdint.h>
#include <stdlib.h>



uint16_t single_code(resistor_band_t color){
    return (uint16_t) color;    
}

resistor_value_t color_code(resistor_band_t colors[]){
        resistor_value_t res;
        uint16_t digit2 = single_code(colors[1]);
        res.value = (digit2 == 0) ? single_code(colors[0]) : single_code(colors[0])*10 + single_code(colors[1]);
        uint16_t zeros = single_code(colors[2]);
        if (!digit2) 
            zeros++;
        switch(zeros % 3){
            case 1: res.value *= 10;
                    break;
            case 2: res.value *= 100;
                    break;
            default: 
                break;
        }
        res.unit = (ohm_units_t) (zeros/3);
        return res;
}



