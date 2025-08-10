#if !defined(CRYPTO_SQUARE_H)
#define CRYPTO_SQUARE_H
#include <string>

namespace crypto_square {

    struct cipher {

        unsigned int rows;
        unsigned int cols;
        unsigned int pad;
        std::string norm_text;
        
           
        cipher (std::string plaintext);
        std::string normalized_cipher_text();
    };

}  // namespace crypto_square

#endif // CRYPTO_SQUARE_H