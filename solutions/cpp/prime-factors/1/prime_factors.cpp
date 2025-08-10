#include "prime_factors.h"
#include <vector>
using namespace std;

namespace prime_factors {
    vector<int> of(int num){
        vector<int> factors{};
        for(int k=2; k<=num/2 ;k++)
            while(!(num % k)){
                factors.push_back(k);
                num /= k;
                }
        if (num>1) 
            factors.push_back(num);
        return factors;
        }
}  // namespace prime_factors
