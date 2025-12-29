#include "hexadecimal.h"
#include <string>

namespace hexadecimal {

    int convert(std::string hex){
        int result = 0;
        for(auto c : hex) {
            int d;
            if (isdigit(c)) 
                    d = (int(c) - 48);
            else if (isalpha(c) && (97<= int(c)) && (int(c)<=102))
                    d = (int(c) - 97) + 10;                           
            else {
                    result = 0;
                    break;
                } 
            result <<= 4;
            result += d;
        }
        return result;
    }

}  // namespace hexadecimal
