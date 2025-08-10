#include "sum_of_multiples.h"

#include <set>

using namespace std;

namespace sum_of_multiples {

    int to(set<int> factors, int limit){
        set<int> s{0};
        for(int f: factors){
            int m = f;
            while(m<limit){
                if(m!=0) 
                    s.insert(m);
                m += f;
            }
        }
        int sum = 0;
        for(int n : s){
            sum += n;
        }
        return sum;
    }
    

}  // namespace sum_of_multiples
