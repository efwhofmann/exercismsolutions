#include "crypto_square.h"
#include <regex>
#include <cmath>

using namespace std;

namespace crypto_square {

    cipher::cipher(string plaintext){
        norm_text = "";
        for(string::iterator it=plaintext.begin(); it!=plaintext.end(); ++it){
            char ch = *it;
            if(isalpha(ch))
                norm_text += tolower(ch);
            else if(isdigit(ch))
                norm_text += ch;
        }
        unsigned int len = norm_text.length();
        cols = static_cast<unsigned int>(ceil(sqrt(len)));
        rows = (cols-1)*cols >= len ? cols-1 : cols;
        pad = cols*rows - len;
    }

    string cipher::normalized_cipher_text(){
        string out="";
        unsigned int len = norm_text.length();
        for(unsigned int i=0; i<cols; i++){
            for(unsigned int j=0; j<rows; j++){
                unsigned int idx = j*cols + i;
                if(idx<len) 
                    out += norm_text.at(idx);
            } 
            if(i>=cols-pad) out+=" ";
            if(cols>0 && i<cols-1) out+=" ";
        }
        return out;
    }
        
    

}  // namespace crypto_square
