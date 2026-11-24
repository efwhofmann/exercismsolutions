#include "word_count.h"

#include <vector>
#include <regex>
#include <iostream>
#include <algorithm>
#include <cctype>


namespace word_count {

std::map<std::string, int> words(std::string input) {
    std::map<std::string, int> word_map;
    std::transform(input.begin(), input.end(), input.begin(),
        [](unsigned char c) { return std::tolower(c); });
    std::regex word_regex(R"(\w+('\w+)?)");
    std::sregex_iterator iter(input.begin(), input.end(), 
            word_regex);
    auto end = std::sregex_iterator();
    for(;iter!=end; iter++){
        word_map[(*iter).str( )]++;
    }

    return word_map;
}

}  // namespace word_count
