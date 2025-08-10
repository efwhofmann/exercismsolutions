#include "trinary.h"
#include <string>

namespace trinary {
    int to_decimal(std::string trin){
        int i;
        int result = 0;
        int pow3 = 1; 
        for(i= (trin.size()-1); i>=0; i--){
            char c = trin.at(i);
            if(isdigit(c) && ((int(c) - 48)<3)) {
                    int d = (int(c) - 48);
                    if (d) {
                        result += d*pow3; }  
                        pow3 *=3;
               }
            else {
                    result = 0;
                    break;
                } 
        }
        return result;
    }
}  // namespace trinary
