#include "rotational_cipher.h"

#include<algorithm>
#include<cctype>

using namespace std;

namespace rotational_cipher {

    

    string rotate(string plaintext, int rot){
          string result = plaintext;
          transform(result.begin(), result.end(), result.begin(), [rot](int ch){
              if (isalpha(ch)){
                  auto up = isupper(ch);
                  ch += (rot % 26);
                  if( (up && ch>'Z') || (ch>'z') )
                      ch -=26;
              }
              return ch;  
          });
        return result;
    }
}  // namespace rotational_cipher
