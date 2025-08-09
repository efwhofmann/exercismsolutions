#include "scrabble_score.h"
#include <string.h>

unsigned int score_letter(char ltr) {
    if (ltr < 97) ltr+= 32;
    if (ltr > 122) return 0;
    switch (ltr) 
    {
        case 'z' : 
        case 'q' : return 10;
        case 'x' : 
        case 'j' : return 8;
        case 'k' : return 5;
        case 'y' : 
        case 'w' : 
        case 'v' : 
        case 'h' : 
        case 'f' : return 4;
        case 'p' : 
        case 'm' : 
        case 'c' : 
        case 'b' : return 3;
        case 'd' : 
        case 'g' : return 2;   
        default: return 1;        
    }    
}

unsigned int score(const char *word){
        int length = strlen(word);
        int sum = 0; 
        if( 0 < length)
         for (int i=0; i<length; i++) 
            {
               sum += score_letter(word[i]); 
            }
        return sum;       
}

