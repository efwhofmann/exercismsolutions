#pragma once

#include <string>

namespace rail_fence_cipher {

enum class Mode {Encode, Decode};

    
std::string encode(const std::string& plaintext, int num_rails);
std::string decode(const std::string& ciphertext, int num_rails);
std::string encode_decode(const std::string& input, int num_rails, Mode mode);
}  // namespace rail_fence_cipher
