#include "binary.h"

#include <string>
#include <vector>

using namespace std;

namespace binary {

int valid(string strg){
    bool result = true;
    for(size_t i = 0; i!=strg.size(); ++i){
        result = result && ((strg.at(i) == '0') || (strg.at(i) == '1'));
    }    
    return result;
}

int convert(string binary){
    if (!valid(binary)) 
        return 0;
    else {
      int num = 0;
      int twopower = 1; 
      for(size_t i=binary.size(); i--;){
           if(binary.at(i) == '1')
               num += twopower; 
            twopower *= 2;       
          }
        return num;
        }     
}

}  // namespace binary
