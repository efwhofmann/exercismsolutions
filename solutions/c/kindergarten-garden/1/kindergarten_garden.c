#include "kindergarten_garden.h"

#include<string.h>

plant_t letter_to_plant(char);

plant_t letter_to_plant(char lt){
    switch(lt) {
            case 'R' : return RADISHES;
            case 'C' : return CLOVER;
            case 'G' : return GRASS;
            default: return VIOLETS;        
    }
}


plants_t plants(const char* diagram, const char* student) {
    plants_t result;
    int stNo = student[0] - 'A';
    int offset = strlen(diagram)/2+1 + 2*stNo;
    char plant_ltr[4];
    plant_ltr[0] = diagram[2*stNo]; 
    plant_ltr[1] = diagram[2*stNo +1];
    plant_ltr[2] = diagram[offset];
    plant_ltr[3] = diagram[offset + 1];
    for(int i=0; i<4; i++) {
        result.plants[i] = letter_to_plant(plant_ltr[i]); 
    }  
    return result;    
}

