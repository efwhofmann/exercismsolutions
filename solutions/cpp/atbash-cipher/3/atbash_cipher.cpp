#include "atbash_cipher.h"

#include <algorithm>
#include <string>


using namespace std;

namespace atbash_cipher{

    string cipher(string msg){
        string out = msg;
        auto new_end = remove_if(out.begin(), out.end(), [](unsigned char ch){return isspace(ch) || ispunct(ch);});
        out.erase(new_end, out.end());
        transform(out.begin(), out.end(), out.begin(), [](unsigned char ch){
            return isalpha(ch) ? 'z' - (tolower(ch) - 'a') : ch;
        });
        return out;
    }    
     
    string encode(string input){
        string str =  cipher(input);
        for(auto idx = str.begin() + 5; idx < str.end();  idx += 6){
            str.insert(idx, ' ');
        }
        return str;
    }

    string decode(string code){
        return cipher(code);
    }    

}  // namespace atbash_cipher
