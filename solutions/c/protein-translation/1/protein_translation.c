#include "protein_translation.h"

#include <string.h>
#include <stdio.h>


protein_t translate(const char *cur){
    protein_t res;
    /* printf("%s", cur);*/
    if (strcmp(cur, "AUG") == 0) {
        res = Methionine; }
    else if (strcmp(cur, "UUU") == 0
             || strcmp(cur, "UUC") == 0){ 
         res = Phenylalanine;}
    else if (strcmp(cur, "UUA") == 0 
             || strcmp(cur, "UUG")==0) {
                res = Leucine;  }
     else if (strcmp(cur, "UCU")==0 || strcmp(cur, "UCC")==0 || 
              strcmp(cur, "UCA") == 0 || strcmp(cur, "UCG")==0){
         res = Serine; }
    else if (strcmp(cur, "UAU")==0 || strcmp(cur, "UAC")==0){
         res = Tyrosine;}
    else if (strcmp(cur, "UGU")==0 || strcmp(cur, "UGC")==0) {
        res = Cysteine;  }
    else if (strcmp(cur, "UGG")==0) {res = Tryptophan;}
    else if (strcmp(cur, "UAA")==0 || strcmp(cur, "UAG")==0 ||
             strcmp(cur, "UGA")==0) {res = STOP;}
    else {res = INVALID;}
    return res;
}


proteins_t proteins(const char *const rna){
    size_t len = strlen(rna);
    proteins_t ps = (proteins_t){.count=0, .valid=true};
    for(size_t i=0; i<len; i+=3){
        char cur_rna[4];
        protein_t cur;
        strncpy(cur_rna, rna+i, 3);
        cur_rna[3] = '\0';
        cur = translate(cur_rna);
        if(cur == INVALID) {
            ps.valid = false;
            break;
        }
        if (cur == STOP){
            break;
        }
        else {
            ps.proteins[ps.count++] = cur;
        }
    }
    return ps;
}
