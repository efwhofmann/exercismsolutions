#include "allergies.h"


bool is_allergic_to (allergen_t allergen, int code) {
        return (0 != (code & (1 << allergen))); 
}

allergen_list_t get_allergens(int code){    
    allergen_list_t result = {.count=0, 
        .allergens={false, false, false, false, false, false, false, false}};
    for(int i=ALLERGEN_EGGS; i<ALLERGEN_COUNT; i++){
        if( is_allergic_to(i, code) ) {
            result.count++; 
            result.allergens[i] = true; }
        else
            result.allergens[i] = false;
    }
    return result;
}