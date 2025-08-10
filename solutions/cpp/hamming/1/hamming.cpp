#include "hamming.h"
#include <stdexcept>

using namespace std;

namespace hamming {

    unsigned int compute(string strandA, string strandB){
        unsigned int  len = strandA.length();
        if (strandB.length()!=len) 
            throw domain_error("");
        unsigned int result = 0;
        for(unsigned int i = 0; i<len; i++){
                result += strandA.at(i)!=strandB.at(i) ? 1 : 0;
            }
        return result;
    }
}  // namespace hamming
