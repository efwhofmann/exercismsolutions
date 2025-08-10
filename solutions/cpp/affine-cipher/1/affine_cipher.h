#ifndef AFFINE_CIPHER_H
#define AFFINE_CIPHER_H

#include <string>

namespace affine_cipher {

    
std::string cipher(std::string msg, int keya, int keyb);
std::string encode(std::string plaintext, int a, int b);
std::string decode(std::string ciphertext, int a, int b);

}  // namespace affine_cipher

#endif  // AFFINE_CIPHER_H