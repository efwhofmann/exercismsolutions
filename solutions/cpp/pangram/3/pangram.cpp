#include "pangram.h"
#include <string>
#include <unordered_set>

namespace pangram {

      bool is_pangram(std::string input){
          std::unordered_set<char>  alphabet;
          for(auto letter : input)
              {
                 if(std::isalpha(letter)){
                     alphabet.insert(std::tolower(letter));
                 } 
              }
          return alphabet.size() == 26;
    }

}  // namespace pangram
