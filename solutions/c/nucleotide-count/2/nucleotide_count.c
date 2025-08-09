#include "nucleotide_count.h"

#include<stdlib.h>
#include<stdio.h>
#include<stdbool.h>
#include<string.h>

const char *format = "A:%d C:%d G:%d T:%d";

char *count(const char *dna_strand){
    int nos[4] = {0,0,0,0}; 
    size_t len = strlen(dna_strand);
    bool valid = true; 
    char* out_str;
    for(size_t i=0; i<len && valid; ++i){
        switch(dna_strand[i]){
            case 'A':
                nos[0]++;
                break;
            case 'C':
                nos[1]++; 
                break;
            case 'G':
                nos[2]++;
                break;
            case 'T':
                nos[3]++;
                break;
            default:
                valid = false;
        }
    }
    int n_chars = 0;
    if(valid)
           n_chars = snprintf(NULL, 0,  format, nos[0], nos[1], nos[2], nos[3]);
   
    if(n_chars <0 || !(out_str = malloc((size_t) (n_chars + 1))))
            return NULL;
    else if(valid)
           snprintf(out_str, (size_t)(n_chars + 1 ), format, nos[0], nos[1], nos[2], nos[3]); 
    else *out_str='\0';
    return out_str;
}