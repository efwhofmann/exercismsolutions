#include "sum_of_multiples.h"

#include <set>
#include <numeric>

using namespace std;

namespace sum_of_multiples {

    int to(set<int> factors, int limit){
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
