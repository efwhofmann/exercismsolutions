#include "prime_factors.h"
#include <vector>
using namespace std;

namespace prime_factors {
    vector<long long> of(long int num){
        vector<long long> factors{};
        for(auto k=2; k*k<=num ;k++)
            while(!(num % k)){
                factors.push_back(k);
                num /= k;
                }
       if (num>1) 
            factors.push_back(num);
        return factors;
        }
}  // namespace prime_factors
