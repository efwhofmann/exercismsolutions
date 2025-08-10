#pragma once

#include <array>
#include <string>

namespace kindergarten_garden {

    enum class Plants {
        clover,
        grass,
        violets,
        radishes
    };

    std::array<Plants,4> plants(std::string, std::string);
    

}  // namespace kindergarten_garden
