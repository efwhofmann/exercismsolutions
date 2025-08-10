#include "reverse_string.h"
#include <string>

namespace reverse_string {
    std::string reverse_string(std::string input) {
        std::string out{};
        if (input.length() <= 1) 
            return input;
        for(int i=input.length()-1; i>=0; i--){
                out.push_back(input.at(i));                
        }
        return out;
    }
}  // namespace reverse_string
