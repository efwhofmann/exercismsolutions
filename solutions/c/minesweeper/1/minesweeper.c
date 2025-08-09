#include "minesweeper.h"

#include <malloc.h>
#include <string.h>

static size_t nr_rows = 0;


char **annotate(const char **minefield, const size_t rows){
    const int delta_r[] = {-1,-1,0,1,1,1,0,-1};
    const int delta_c[] = {0,1,1,1,0,-1,-1,-1};
    if (0==rows)
        return NULL;
    nr_rows = rows;
    char **board = calloc(rows, sizeof(char*));
    size_t cols = strlen(minefield[0]);
    for(size_t i=0; i<rows; i++){
        board[i] = calloc(cols, sizeof(char));
     }
    for(size_t r=0; r<rows; r++){
        for(size_t s = 0; s<cols; s++){            
            if('*' == minefield[r][s]) {
                board[r][s] = '*';                
            } 
            else {
              int count = 0; 
               for(size_t d = 0; d < 8; d++){
                   int new_row = r + delta_r[d];
                   int new_col = s + delta_c[d];
                   if(new_row >= 0 && new_row < (int)rows && 
                       new_col >= 0 && new_col < (int)cols) 
                              if('*' == minefield[new_row][new_col])
                                   count++;
             }
                board[r][s] = (0==count) ? ' ' : (char)(count + '0'); 
            }    
        }            
    }
    return board;
}

void free_annotation(char **annotation){
    if(!annotation)
        return;
    else 
    {
        for (size_t i = 0; i< nr_rows; i++)
            free(annotation[i]);
        free(annotation);       
        nr_rows = 0;
    }
}
