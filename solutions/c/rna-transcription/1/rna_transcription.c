#include "rna_transcription.h"
#include <stdlib.h>
#include <string.h>

char *to_rna(const char *dna){
    size_t len = strlen(dna);
    char* rna = calloc(len,sizeof(char));
    for(size_t i=0; i<len; i++){
        switch(dna[i]){
            case 'A': rna[i] = 'U';
                        break;
            case 'G': rna[i] = 'C';
                        break;
            case 'C': rna[i] = 'G';
                        break;
            case 'T': rna[i] = 'A';
                        break;
            default: break;    
        }
    }
    return rna;
}
