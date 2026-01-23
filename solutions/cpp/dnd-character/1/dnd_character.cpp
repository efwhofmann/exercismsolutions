#include "dnd_character.h"
#include <random>


namespace dnd_character {
    
    int modifier(int score) {
        int x = score-10;
        if (x<0) x--;
        return x/2;    
    }

    int roll() {
        std::random_device rd; 
        std::mt19937 gen(rd());
        std::uniform_int_distribution<> die(1,6);
        return die(gen);
    }
    
    int ability() {
        int rolls[] = {roll(), roll(), roll(), roll()};
        int min = rolls[0];
        int sum=0;
        for(int i=0; i<4; i++) {
            sum += rolls[i];
            if (rolls[i]<min) {min = rolls[i];}                    
        }
        return sum-min;        
    }    

}  // namespace dnd_character
