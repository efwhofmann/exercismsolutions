#include "affine_cipher.h"

#include <algorithm>
#include <cctype>
#include <stdexcept>
#include <map>

using namespace std;

namespace affine_cipher {

// pairs of valid a's and their modular inverses (mod 26)
    map<int,int> keys_and_inverses  = {
    {1,1}, {3, 9}, {5,21}, {7,15}, {9,3}, {11,19}, {15,7}, {17,23}, {19,11}, {21,5}, {23,17}, {25,25}};
   

    string cipher(string msg, int a, int b, bool decoding){ 
        //valid keys?
          auto search = keys_and_inverses.find(a);
          if (search == keys_and_inverses.end()){
               throw std::invalid_argument("a must be coprime to 26");
          }
        // remove spaces and punctuation
          string out = msg;
          auto new_end = remove_if(out.begin(), out.end(), [](unsigned char ch){return isspace(ch) || ispunct(ch);});
         out.erase(new_end, out.end());
        // encode
        if(!decoding){
           transform(out.begin(), out.end(), out.begin(), [a,b](unsigned char ch){
              return isalpha(ch) ? 
                  ((tolower(ch)-'a')*a + b) % 26 + 'a' : ch; });
        } else { // or decode
            int ia = search->second;
            transform(out.begin(), out.end(), out.begin(), [ia,b](unsigned char ch){
                if (isdigit(ch)) {
                    return ch; }
                else {
                   int de = 
                        (ia*((tolower(ch)-'a') - b))% 26;
                    while (de < 0)
                        de += 26;
                    return (unsigned char)('a' + de);
                }});
        }
        return out;
    }

    string encode(string plaintext, int a, int b){
        string str = cipher(plaintext, a, b, false);
        // group
        for(auto idx = str.begin() + 5; idx < str.end();  idx += 6){
            str.insert(idx, ' ');
        }
        return str;
    }

    
    
    string decode(string ciphertext, int a, int b){      
        return cipher(ciphertext, a, b, true);
    }

}  // namespace affine_cipher