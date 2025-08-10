#include "isbn_verifier.h"

#include <vector>

using namespace std;

namespace isbn_verifier {

    bool is_valid(string isbn) {
        unsigned int factor=10;
        int sum = 0;
        for(auto ch : isbn) {
            if (ch=='-') 
                continue;
            bool valid = isdigit(ch) ||
                        (ch=='X' && factor==1);
            if(!valid) 
                return false;
            else {
                int val = ch == 'X' ? 10 : ch - '0'; 
                sum += val*factor; } 
            factor--;
        }
        return factor==0 && 0==sum%11;
    }


}  // namespace isbn_verifier