#include "word_count.h"
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include <stddef.h>


void lowercase_word(char* word){
    for(size_t i=0; word[i]; i++)
        word[i] = tolower(word[i]);
}


size_t store_and_count(char *word, word_count_word_t *words, size_t wcount){
    lowercase_word(word);
    
    if(word[strlen(word)-1] == '\'') 
        word[strlen(word)-1] = 0;
   
    for(size_t i=0; i<= wcount; i++){
        if(!strcmp(words[i].text, word)){
            words[i].count++;
            return wcount;
        }
    }
    strcpy(words[wcount].text, word);
    words[wcount].count = 1;
    return (wcount+1);
}


int count_words(const char *sentence, word_count_word_t *words){
    size_t len = strlen(sentence);
    if(!len)
        return -1;
    char current_word[MAX_WORD_LENGTH + 1] = {0};
    size_t word_count = 0;
    size_t j=0;
    
    for(size_t i=0; i<len; i++){
        if(isalnum(sentence[i]) || (j>0 && sentence[i] == '\'')){
            if(j>=MAX_WORD_LENGTH)
                    return -1;
            current_word[j] = sentence[i];
            j++;            
        } 
        else if(j>0) {
                word_count = store_and_count(current_word, words, word_count);
                memset(current_word, 0, strlen(current_word));
                j=0;   
        }           
    }
    if(j>0) {
        word_count = store_and_count(current_word, words, word_count);
    }
    return word_count;
}
