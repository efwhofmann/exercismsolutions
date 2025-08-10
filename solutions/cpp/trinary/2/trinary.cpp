#include "trinary.h"
#include <string>

namespace trinary {
    int to_decimal(std::string trin){
        int result = 0;
        for(auto ch : trin) {
            if ( ch <'0' || ch > '2')
                return 0;
            result = 3*result + (ch - '0');
        }
        return result;
    }
}  // namespace trinary
