#include "all_your_base.h"
#include <vector>
#include <cstddef>
#include <stdexcept>
#include <stdlib.h>

using namespace std;

namespace all_your_base {

bool is_valid (int a, vector<unsigned int> digits){
      for(size_t i=0; i!=digits.size(); ++i){
              if (digits.at(i)>=abs(a))
                  return false;
            }  
        return true;
}

int digits_to_int(int a, vector<unsigned int> digits){
    int num = 0;
    int a_power = 1;
    for(size_t i=digits.size(); i--;){
        num +=digits.at(i)*a_power;
        a_power *= a;
    }
    return num;
}

vector<unsigned int> int_to_digits(int num, int b){
    vector<unsigned int> digits;
    while(num>0){
        digits.insert(digits.begin(),(num % b));
        num = num/b;
    }
    return digits;
}

vector<unsigned int> convert(int a, vector<unsigned int> digits, int b){
    if(((a>1) && (b>1)) && (is_valid(a, digits))){
         int number = digits_to_int(a, digits);
         return int_to_digits(number, b);
    } else 
        throw std::invalid_argument("Invalid input.");
 }

}  // namespace all_your_base
