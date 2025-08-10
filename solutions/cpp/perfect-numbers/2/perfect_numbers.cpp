#include "perfect_numbers.h"
#include <stdexcept>

namespace perfect_numbers {

classification classify(int num){
    int sum = 0;
    if (num<=0) 
        throw std::domain_error("N must be >0.");
    for(int k=1; k<num; k++){
        if (num % k == 0)
            sum += k;}
    if(sum == num)
        return classification::perfect;
    else if (sum > num)
        return classification::abundant;
    else // (sum < num)
        return classification::deficient;
        
}



}  // namespace perfect_numbers
