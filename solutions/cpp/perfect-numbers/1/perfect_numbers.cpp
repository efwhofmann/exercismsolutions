#include "perfect_numbers.h"
#include <stdexcept>

namespace perfect_numbers {

aliquot_type classify(int num){
    int sum = 0;
    if (num<=0) 
        throw std::domain_error("N must be >0.");
    for(int k=1; k<num; k++){
        if (num % k == 0)
            sum += k;}
    if(sum == num)
        return perfect;
    else if (sum > num)
        return abundant;
    else // (sum < num)
        return deficient;
        
}



}  // namespace perfect_numbers
