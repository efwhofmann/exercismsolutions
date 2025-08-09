#include "high_scores.h"

int32_t latest(const int32_t *scores, size_t scores_len){
    return scores[scores_len-1];    
}

int32_t personal_best(const int32_t *scores, size_t scores_len){
    int32_t best = 0;
    for(size_t i=0; i<scores_len; i++){
        best = scores[i] > best ? scores[i] : best;        
    }
    return best;
}

size_t personal_top_three(const int32_t *scores, size_t scores_len,
                          int32_t *output){
    int32_t top[3] = {0};
    size_t no = 0;
    for(size_t i=0; i< scores_len; i++){
        int32_t current = scores[i];
        if(current > top[2]){
            if(no<3)
                no++;
            if(current > top[1]) {
                top[2] = top[1];
                if(current > top[0]){
                    top[1] = top[0];
                    top[0] = current;
                } else { 
                    top[1] = current;}                
            }
            else {
                top[2] = current;            }
        }
    }
    for(size_t j=0; j<no; j++)
        output[j] = top[j];
    return no;
}
