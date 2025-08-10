#include "isogram.h"

#include <string>
#include <cctype>
using namespace std;

namespace isogram {
   bool is_isogram(string str){
        bool found_letter[26] = {0};
        for(size_t i=0; i<str.length(); i++){
            char ch = str.at(i);
            if(isalpha(ch)) {
                int idx = tolower(ch) - 'a';
                if(! found_letter[idx])
                    found_letter[idx] = true;
                else 
                    return false;
             }
        }
        return true;
    }
}  // namespace isogram
