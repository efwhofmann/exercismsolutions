#include "knapsack.h"

#include<vector>

namespace knapsack
{

int maximum_value(int max_weight, std::vector<knapsack::Item> items){
    std::vector<std::vector<int>> table(items.size()+1, std::vector<int>(max_weight+1));
    for(unsigned int i=0; i<items.size(); i++){
        knapsack::Item item = items[i];
        for(int capacity=1; capacity<=max_weight; capacity++){
            int prevItemValue = table[i][capacity];
            if(capacity >= item.weight) {
                int newValue = table[i][capacity-item.weight] + item.value;
                table[i+1][capacity] = 
                    newValue > prevItemValue ? newValue : prevItemValue;
            } else {
                table[i+1][capacity] = prevItemValue;
            }
        }}
        return table[items.size()][max_weight];
    }


    
} // namespace knapsack

