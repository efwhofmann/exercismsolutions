#include "word_count.h"

#include <vector>
#include <regex>
#include <iostream>
#include <algorithm>
#include <cctype>

using namespace std;


namespace word_count {

map<string, int> words(string input) {
    map<string, int> word_map;
    transform(input.begin(), input.end(), input.begin(),
        [](auto c) { return std::tolower(c); });
    regex word_regex(R"(\w+('\w+)?)");
    sregex_iterator iter(input.begin(), input.end(), 
            word_regex), end;
    for(;iter!=end; iter++){
        word_map[(*iter).str( )]++;
    }

    return word_map;
}

}  // namespace word_count
