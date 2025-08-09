#include "knapsack.h"
#include <stdlib.h>
#include <malloc.h>

unsigned int maximum_value (unsigned int maximum_weight, item_t *items, size_t item_count){
    if(!items)
        return 0;
    unsigned int **table 
        = (unsigned int**) calloc((item_count+1), sizeof(unsigned int *));
    if(!table)
        return 0;
    for(size_t i=0; i<item_count+1;i++){
        table[i] 
            = (unsigned int*) calloc(maximum_weight+1, sizeof(unsigned int));
    }
    for(size_t j=0; j<item_count; j++){
        item_t cur = items[j];
        for(unsigned int wght=1; wght<=maximum_weight; wght++) {
            unsigned int prev_item_val = table[j][wght];
            if(wght>=cur.weight){
                unsigned int new_val
                    = table[j][wght - cur.weight] + cur.value;
                table[j+1][wght] = new_val > prev_item_val ? new_val : prev_item_val;
            }
            else 
               table[j+1][wght] = prev_item_val; 
        }
    }
    unsigned int weight = maximum_weight;
    int result = 0;
    for(size_t k=item_count; k>0; k--){
        if(table[k][weight] != table[k-1][weight]){
            result += items[k-1].value;
            weight -= items[k-1].weight;
        }            
    }
    for(size_t i=0; i<item_count+1; i++){
        free(table[i]);
    }
    free(table);
    return result;    
}
