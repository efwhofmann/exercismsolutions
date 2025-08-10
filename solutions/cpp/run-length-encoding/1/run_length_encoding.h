#pragma once

#include <string>

namespace run_length_encoding {

    std::string encode(std::string text);
    std::string decode(std::string data);

}  // namespace run_length_encoding
