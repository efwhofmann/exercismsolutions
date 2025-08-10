#include "eliuds_eggs.h"

namespace chicken_coop {
     unsigned int positions_to_quantity(unsigned int n){
         unsigned int sum = 0;
         while(n>0) {
             sum += (n & 1); 
             n = n>>1;
         }
         return sum;
     }


}  // namespace chicken_coop
