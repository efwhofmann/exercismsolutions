#include "sum_of_multiples.h"

#include <set>

using namespace std;

namespace sum_of_multiples {

    int to(set<int> factors, int limit){
        set<int> s{0};
        int sum = 0;
        for(int f: factors){
            for(int m=f; m<limit && m!=0; m+=f){
                   if(s.find(m)==s.end()){ 
                       s.insert(m);
                       sum += m;
                   }
            }
        }
        return sum;
    }
    

}  // namespace sum_of_multiples
