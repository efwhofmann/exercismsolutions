#include "sieve.h"
#include <vector>
#include <numeric>

using namespace std;

namespace sieve {
     vector<int> primes(int limit){
            vector<int> numbers(limit);
            vector<int> prims{};
            iota(numbers.begin(), numbers.end(), 1) ;
            int n=2;
            while(n<=limit){
                for (int k=n*n; k<=limit; k+=n){
                    numbers[k-1]=0;
                }   
                while(!numbers[(++n)-1]);
            }   
            for (int i=1; i<limit; i++){
                if (numbers[i] !=0) {prims.push_back(numbers[i]);} 
            }   
            return prims;
     }
}  // namespace sieve
