#include "sieve.h"
#include <vector>
#include <numeric>

using namespace std;

namespace sieve {
     vector<int> primes(int limit){
            vector<int> numbers(limit);
            vector<int> prims{};
            iota(numbers.begin(), numbers.end(), 1);
            int n=2;
            while(n<=limit){
                prims.push_back(n);
                for (int k=n*n; k<=limit; k+=n){
                    numbers[k-1]=0;
                }   
                while(!numbers[(++n)-1]);
            }   
            return prims;
     }
}  // namespace sieve
