#include "luhn.h"
#include <string>
#include <algorithm>

using std::string;

namespace luhn {
    bool valid (string number){
       int sum=0;
       char c;     
       auto end_pos = remove(begin(number), end(number), ' ');
       number.erase(end_pos, end(number));
       if (number.length()<=1)
            return false;
        for (int i=number.length()-1; i>=0; i--){
                c = number.at(i);
                if (isdigit(c)){
                   int d = (int(c) - 48);
                   if (!((number.length() - i)%2)) 
                       (d!=9) ? (d = 2*d % 9) : (d=9);
                   sum += d;
                } else 
                  return false;                 
        }
        return !(sum % 10);
    }
}  // namespace luhn
