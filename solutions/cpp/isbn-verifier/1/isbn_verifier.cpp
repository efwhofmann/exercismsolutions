#include "isbn_verifier.h"

#include <vector>

using namespace std;

namespace isbn_verifier {

    bool is_valid(string isbn) {
        vector<int> digits;
        bool valid = true;
        unsigned int count=0;
        for(auto ch : isbn) {
            if (isdigit(ch)) {
                digits.push_back(ch-'0');
                count++;
            } else if (ch=='X') {
                if(count!=9){
                    valid = false;
                    break;
                }
                digits.push_back(10);
                count++;
            }  else if (ch!='-'){
                valid = false;
                break;
            }            
        }
        if(!valid || digits.size()!=10)
            return false;
        else {
            int sum = 0;
            for (auto i=0; i<10; i++) {
               sum += digits[i]*(10-i); 
            }
            return 0==sum%11;
        }
    }


}  // namespace isbn_verifier