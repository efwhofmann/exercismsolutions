#include "saddle_points.h"

#include<assert.h>
#include<stdlib.h>
#include<string.h>

saddle_points_t *saddle_points(int rows, int cols, uint8_t matrix[rows][cols]){
    assert(rows>=0 && cols>=0);
    assert(matrix || (rows==0 && cols==0));
    saddle_points_t *result = malloc(sizeof(*result) + (size_t)(rows*cols)*sizeof(*result->points));
    if (!result) return NULL;

    result->count = 0;
    if (cols==0 || rows==0)
           return result;

    uint8_t *max_row_values = calloc((size_t)rows, sizeof(uint8_t));
    if (!max_row_values) {
        free(result);
        return NULL;
    }

    for (int r=0; r<rows; r++){
        uint8_t max_val = matrix[r][0];
        for(int c=1; c<cols; c++){
            if (matrix[r][c]>max_val) max_val = matrix[r][c];
        }
        max_row_values[r] = max_val;
    }


    uint8_t *min_col_values  = calloc((size_t)cols,  sizeof(uint8_t));
    if (!min_col_values) {
        free(max_row_values);
        free(result);
        return NULL;
    }
    for(int c=0; c<cols; c++){
        uint8_t min_val = matrix[0][c]; 
        for(int r=1;r<rows; r++){
            if (matrix[r][c]<min_val) min_val = matrix[r][c];
        }
        min_col_values[c] = min_val;
    }

    for(int r=0; r<rows; r++){
        for(int c=0; c<cols; c++){
            if ((matrix[r][c] == max_row_values[r]) && 
                (matrix[r][c] == min_col_values[c])) {
                    result->points[result->count++] = 
                        (saddle_point_t){ .row=r+1, .column=c+1 };
                } 
        }
    }
    free(max_row_values);
    free(min_col_values);
    return result;
    
    
}


void free_saddle_points(saddle_points_t * sdl_pts){
    free(sdl_pts);
}