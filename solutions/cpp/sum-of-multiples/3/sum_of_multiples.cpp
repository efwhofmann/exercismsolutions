#include "sum_of_multiples.h"

#include <set>
#include <numeric>

using namespace std;

namespace sum_of_multiples {

    int to(set<int> factors, int limit){
        set<int> s{0};
        for(int f: factors){
            for(int m=f; m<limit && m!=0; m+=f){
                       s.insert(m);
            }
        }
        return reduce(s.begin(), s.end());
    }
    

}  // namespace sum_of_multiples
