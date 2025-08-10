#include "armstrong_numbers.h"
#include <vector>

namespace armstrong_numbers {
    bool is_armstrong_number(int num){
        std::vector<int> digits{};
        if (!num)
            return true;
        else {
            int n = num;
            while (n>0) {
                digits.push_back( n%10);
                n /= 10;
            }
            int k=digits.size();
            int sum = 0;
            for(int i=0; i<k; i++){
                int power = digits.at(i);
                for (int j=1; j<k; j++){
                  power = power * digits.at(i);  
                }
                sum += power;
            }
            return (sum == num);           
        }
        }
}  // namespace armstrong_numbers
