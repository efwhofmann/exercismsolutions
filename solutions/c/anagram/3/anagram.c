#include "anagram.h"

#include <string.h>
#include <ctype.h>


char letter_counts[26];

void initialize_letters(const char *original);

void initialize_letters(const char *original){
    memset(letter_counts, 0, 26);
    for(size_t i=0; i<strlen(original); i++){
        letter_counts[(tolower(original[i]) - 'a')]++;
    }
}


bool is_anagram(const char *original, const char *candidate){
    size_t len = strlen(original);
    if(len != strlen(candidate))
        return false;
    char word[len];
    char cand[len];
    char new_count[26] = {0};
    bool same_letters = true;
    for(size_t i=0; i<len; i++){
        char c = tolower(candidate[i]);
        int idx = c -'a';
        new_count[idx]++;
        same_letters = same_letters && 
            (letter_counts[idx] >= new_count[idx]);
        if(!same_letters)
            break;
        cand[i] = c;
        word[i] = tolower(original[i]);        
    }
    return (same_letters && strcmp(cand, word)!=0);   
}

void find_anagrams(const char *subject, struct candidates *candidates){
    initialize_letters(subject);
    for(size_t i=0; i<candidates->count; i++) {
        if(is_anagram(subject, candidates->candidate[i].word)) 
             candidates->candidate[i].is_anagram = IS_ANAGRAM;
        else 
            candidates->candidate[i].is_anagram = NOT_ANAGRAM;
    }
}
