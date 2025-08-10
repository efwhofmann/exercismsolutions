#include "atbash_cipher.h"

#include <cctype>
#include <string>
using namespace std;

namespace atbash_cipher{

    string cipher(string msg, bool partition){
        string out{};
        char ch; 
        int ch_cnt = 0;
        for (unsigned int i=0; i<msg.length(); i++) {
          ch = msg.at(i); 
          if (isalpha(ch)){
              out.push_back(char(122 - (int(tolower(ch)) - 97)));
              ch_cnt++;
              }
          else if (isdigit(ch)){
              out.push_back(ch);
              ch_cnt++;
            }
          else {;}
          if(partition && (ch_cnt == 5)){
              out += " ";
              ch_cnt = 0;
              }     
        }
        while (isspace(out.at(out.length() -1))) 
            out.pop_back();
        return out;
    }

    
     
    string encode(string input){
        return cipher(input, true);
    }

    string decode(string code){
        return cipher(code, false);
    }

    

}  // namespace atbash_cipher
