#include "sum_of_multiples.h"

#include <initializer_list>
#include <algorithm>

namespace sum_of_multiples {

    int to(std::initializer_list<int> factors, int limit){
        int sum{0};
        for(int m=1; m<limit; m++){
            if(std::any_of(factors.begin(), 
                factors.end(),
                [m](int f){
                    return m % f == 0;}))
            {
                    sum += m;
            }
        }
        return sum;
    }
    

}  // namespace sum_of_multiples
