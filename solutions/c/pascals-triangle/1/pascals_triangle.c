#include "pascals_triangle.h"

#include <malloc.h>
#include <string.h>

#define ZERO2ONE(nrows) ( (nrows>0) ? nrows : 1)

void fill_row(uint8_t**, size_t);

void fill_row(uint8_t **triangle, size_t i){
        for (size_t j = 0; j<(i+1); j++){
            if (0==j || i == j) 
                triangle[i][j] = 1;
            else 
                triangle[i][j] = triangle[i-1][j-1] + triangle[i-1][j];     
        }
}

uint8_t **create_triangle(size_t rows)
{
    uint8_t **triangle = calloc(ZERO2ONE(rows), sizeof(uint8_t*));
    if(!triangle)  return NULL;
    if(0==rows){
        triangle[0] = calloc(1, sizeof(triangle[0]));
        if (!triangle[0]) {free(triangle); return NULL;}
        return triangle;
    }
    for(size_t i = 0;i<rows; i++){
        triangle[i] = calloc(rows ,sizeof(uint8_t));
        memset(triangle[i], 0, rows*sizeof(uint8_t));
        fill_row(triangle, i);
    }
    return triangle;
}

void free_triangle(uint8_t **triangle, size_t rows){
    if(!rows)
        return;
     for(size_t i = 0;i<ZERO2ONE(rows); i++){
        free(triangle[i]);
    }
    free(triangle);
    return;
}