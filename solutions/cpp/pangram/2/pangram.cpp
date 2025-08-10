#include "pangram.h"
#include <string>

using namespace std;

namespace pangram {

      bool is_pangram(string input){
          string alphabet="abcdefghijklmnopqrstuvwxyz";
          unsigned int i;
          bool letter_found;
          bool result = true;
          for(i = 0; i<26; i++)
          {
             letter_found =      
          (input.find(alphabet.at(i),0)!= string::npos) ||
          (input.find(toupper(alphabet.at(i)),0)!=string::npos);
              result = result && letter_found;
         }
         return result;
    }

}  // namespace pangram
