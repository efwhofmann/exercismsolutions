#include "rail_fence_cipher.h"

namespace rail_fence_cipher {



std::string encode(const std::string& plaintext, int num_rails) {
    return encode_decode(plaintext, num_rails, Mode::Encode);
}

std::string decode(const std::string& ciphertext, int num_rails) {
    return encode_decode(ciphertext, num_rails, Mode::Decode);
}

std::string encode_decode(const std::string& input, int num_rails, Mode mode) {
        std::string output(input.length(), ' ');
        size_t max_step = 2*(num_rails-1); 
        size_t pos_cipher = 0;
        for(size_t rail = 0; rail<(size_t) num_rails; ++rail){
         size_t step = ( 0==rail ) ? max_step : 2*rail;
         for(auto pos_text = rail; 
             pos_text < input.length();
             step = (step == max_step) ? max_step : max_step - step, 
             pos_text += step, ++pos_cipher){   
                if(mode == Mode::Encode) 
                    output[pos_cipher] = input[pos_text];
              else 
                  output[pos_text] = input[pos_cipher]; 
         } 
        }   
        return output;    
}

}  // namespace rail_fence_cipher
