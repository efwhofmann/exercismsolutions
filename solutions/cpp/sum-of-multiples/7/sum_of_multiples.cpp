#include "sum_of_multiples.h"

#include <initializer_list>

namespace sum_of_multiples {

    int to(std::initializer_list<int> factors, int limit){
        int sum{0};
        for(int m=1; m<limit; m++){
            for(int f : factors){
                    if (f!=0 && m % f==0) {
                        sum +=m;
                        break;
                    }
            }
        }
        return sum;
    }
    

}  // namespace sum_of_multiples
