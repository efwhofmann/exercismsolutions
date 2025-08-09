#include "dnd_character.h"
#include <stdlib.h>

int ability(void){
    int sum = 0;
    int min = 0;
    for(int j=0; j<4; j++) {
        int throw = rand()%6 + 1;      
        sum += throw;
        min = (throw < min) ? throw : min;
    }
    return sum - min;    
}

int modifier(int score){
    int m = (score-10);
    return (m >= 0) ? m/2 : (m-1)/2;    
}


dnd_character_t make_dnd_character(void){
    dnd_character_t character;
    character.strength = ability();
   character.dexterity = ability();
   character.constitution = ability();
   character.intelligence = ability();
   character.wisdom = ability();
   character.charisma = ability();
   character.hitpoints = 10 + modifier(character.constitution);
   return character; 
}