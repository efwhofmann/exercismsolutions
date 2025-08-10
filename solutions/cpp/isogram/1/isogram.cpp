#include "isogram.h"

#include <string>
#include <cctype>
using namespace std;

namespace isogram {
   bool is_isogram(string str){
        size_t len =  str.length();
        bool found_letter[26] = {0};
        bool isIsogram = true;
        for(size_t i=0; i<len; i++){
            char ch = str.at(i);
            if(isalpha(ch)) {
                int idx = tolower(ch) - 'a';
                if(! found_letter[idx])
                    found_letter[idx] = true;
                else {
                    isIsogram = false;
                    break;
                }
             }
        }
        return isIsogram;
    }
}  // namespace isogram
