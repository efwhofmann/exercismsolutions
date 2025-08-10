#include "series.h"
#include <stdexcept>
#include <cmath>

using namespace std;

namespace series {

    vector<string>slice (string input, int length) {
        unsigned int len = abs(length);
        if(input.empty()) { 
            throw(domain_error("Empty series is invalid."));
        } else if (length<=0) {
            throw(domain_error("Slice length must be positive."));
        } else if(input.length() < len) {
            throw(domain_error("Slice length too large."));
        }
        vector<string> result;
        for(unsigned int i=0; i<input.length()-len+1; i++){
            result.emplace_back(input.substr(i, len));
        }
        return result;
    }
 
}  // namespace series
