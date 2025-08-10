#include "pangram.h"

#include <algorithm>
#include <string>
#include <vector>

namespace pangram {
     bool is_pangram(std::string input){
        std::vector<bool> alphabet(26,false);
        char lt;
        if (input.size()<26) 
            return false;
        for (unsigned int i=0; i<input.size(); i++){
            lt = input.at(i);
            if (isalpha(lt)) 
               alphabet.at(int(tolower(lt)) - 97) = true;
        }
        if (std::find(alphabet.begin(), alphabet.end(), false)!=alphabet.end())
            return false;
         else
            return true;
    }

}  // namespace pangram
