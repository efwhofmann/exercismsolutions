#include "spiral_matrix.h"

#include <malloc.h>
#include <string.h>

int spiral_matrix_destroy(spiral_matrix_t *spm){
    for(int i=0; i<spm->size; i++)
        free(spm->matrix[i]);
    free(spm->matrix);
    free(spm);
    return 0;
}

spiral_matrix_t *spiral_matrix_create(int n){ 
   spiral_matrix_t *sm = calloc(1, sizeof(spiral_matrix_t)); 
    sm->size = n;
    if(0==n)
        return sm;
    sm->matrix = calloc(n, sizeof(int *));
    for (int i=0; i<n; i++){
        sm->matrix[i] = calloc(n, sizeof(int));
        memset(sm->matrix[i], 0, n*sizeof(int));
    }
    
    int pos_x = 0;
    int pos_y = 0;
    int dir_h = 0; 
    int dir_v = 1;
    for(int k=1; k<=n*n; k++){
        sm->matrix[pos_x][pos_y] = k;
        int new_x = pos_x + dir_h;
        int new_y = pos_y + dir_v;
        if(new_x<0 || new_x>=n 
           || new_y <0 || new_y>=n 
           ||(sm->matrix[new_x][new_y]>0 )){
            int t = dir_h;
            dir_h = dir_v;
            dir_v = -t;
           }
        pos_x += dir_h;
        pos_y += dir_v;
    }
    return sm;
}
