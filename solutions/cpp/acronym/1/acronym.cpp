#include "acronym.h"
#include <cctype>

using namespace std;

namespace acronym {
    bool is_space(char c){
        return (c==' '|| c=='-' || c=='_');
    }
    
     const string acronym(const string input){
         string out = string();
         for(size_t i=0; i<input.size(); i++){
             if(0==i || is_space(input[i-1]))
                 if(isalpha(input[i]))
                       out+= toupper(input[i]);                     
         }
         return out;
     }

}  // namespace acronym
