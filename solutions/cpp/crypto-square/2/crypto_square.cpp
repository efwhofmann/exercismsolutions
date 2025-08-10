#include "crypto_square.h"
#include <regex>
#include <algorithm>
#include <cmath>

using namespace std;

namespace crypto_square {

    cipher::cipher(string plaintext){
        transform(plaintext.begin(), plaintext.end(), plaintext.begin(), ::tolower);
        regex not_anum("[^a-z0-9]");
        norm_text = regex_replace(plaintext, not_anum,"");
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
