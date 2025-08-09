#include "scrabble_score.h"
#include <string.h>

#define SCORE_COUNT 7

const int scores[] = {1,2,3,4,5,8,10};
const char* letters[] = {"aeioulnrst","dg","bcmp",
                        "fhvwy", "k", "jx", "qz"};

unsigned int score_letter(char ltr) {
    if (ltr < 97) ltr+= 32;
    if (ltr > 122) return 0;
    for(int i=0; i<SCORE_COUNT; i++){
     for(size_t j=0; j<strlen(letters[i]); j++){
         if(letters[i][j] == ltr) 
             return scores[i];
     }   
    } 
    return 0;
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

