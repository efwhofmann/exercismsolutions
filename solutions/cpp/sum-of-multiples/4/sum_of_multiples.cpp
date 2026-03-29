#include "sum_of_multiples.h"

#include <set>
#include <numeric>

using namespace std;

namespace sum_of_multiples {

    int to(set<int> factors, int limit){
        set<int> s{0};
        int sum{0};
        for(int f: factors){
            for(int m=f; m<limit && m!=0; m+=f){
                    auto ret = s.insert(m);
                    if(!ret.second) continue;
                    sum +=m;
            }
        }
        return sum;
    }
    

}  // namespace sum_of_multiples
