#include "anagram.h"

#include <string.h>
#include <stdbool.h>
#include <ctype.h>

bool is_anagram(const char *original, const char *candidate);

bool is_anagram(const char *original, const char *candidate){
    size_t len = strlen(original);
    if(len != strlen(candidate))
        return false;
    char word[len];
    char cand[len];
    char counts[26];
    memset(counts, 0, 26*sizeof(char));
    bool same = true;
    for(size_t i=0; i<len; i++){
        word[i] = tolower(original[i]);
        cand[i] = tolower(candidate[i]);
        same = same && (word[i] == cand[i]);
        counts[(word[i]-'a')]++;
    }
    if(same)
        return false;
    bool same_ltrs = true;
    for(size_t j=0; j<len; j++){
        bool found = false;
        for(size_t k=0; k<len; k++){
             if(cand[j] == word[k]){
                if(!counts[word[k]-'a'])
                    return false;
                else {
                    counts[word[k]-'a']--;
                    found = true;
                    break;
                }
            }                
        }
        same_ltrs = same_ltrs && found;
    }
    if (!same_ltrs)
        return false;
    else {
        int sum = 0;
        for(size_t i=0; i<26; i++)
            sum += counts[i];
        return (0==sum);
    }
}

void find_anagrams(const char *subject, struct candidates *candidates){   
    for(size_t i=0; i<candidates->count; i++) {
        if(is_anagram(subject, candidates->candidate[i].word)) 
             candidates->candidate[i].is_anagram = IS_ANAGRAM;
        else 
            candidates->candidate[i].is_anagram = NOT_ANAGRAM;
    }
}
