#include "hexadecimal.h"
#include <string>

namespace hexadecimal {

    int convert(std::string hex){
        int result = 0;
        int pow16 = 1; 
        for(int i= (hex.size()-1); i>=0; i--){
            int d;
            char c = hex.at(i);
            if (isdigit(c)) 
                    d = (int(c) - 48);
            else if (isalpha(c) && (97<= int(c)) && (int(c)<=102))
                    d = (int(c) - 97) + 10;                           
            else {
                    result = 0;
                    break;
                } 
            if (d) {
                        result += d*pow16; }  
            pow16 *=16;
        }
        return result;
    }

}  // namespace hexadecimal
