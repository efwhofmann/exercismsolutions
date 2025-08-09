#include "protein_translation.h"
#include <string.h>
#include <stdbool.h>
#include <stdio.h>

static const char* codons[] = {"AUG", "UUU", "UUC", "UUA", "UUG", "UCU", "UCC", "UCA", "UCG", "UAU", "UAC", "UGU", "UGC", "UGG"};
static const amino_acid_t amino_acids[] = {Methionine, Phenylalanine, Phenylalanine, Leucine, Leucine, Serine, Serine, Serine, Serine, Tyrosine, Tyrosine, Cysteine, Cysteine, Tryptophan};


protein_t protein(const char *const rna){
    protein_t ps = {.count=0, .valid=true};
    size_t len =  strlen(rna);
    for(size_t i=0; i<len; i+=3){
            char cur_codon[4];
            strncpy(cur_codon, rna+i, 3);
            cur_codon[3] = '\0';
            if(0==strcmp(cur_codon,"UAA") ||
               0==strcmp(cur_codon,"UAG") ||
               0==strcmp(cur_codon,"UGA")){
                // STOP
                break;
            }
            bool found = false;
            for(size_t j=0; j<14; j++){
                if(0==strcmp(cur_codon, codons[j])) {
                    ps.amino_acids[ps.count++] = amino_acids[j];
                    found = true;
                    break; 
                }
            }
            if(!found){
                ps.valid=false;
                break;
            }           
    }    
    return ps;    
}