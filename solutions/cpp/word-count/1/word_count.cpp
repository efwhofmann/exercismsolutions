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
    regex sep_regex = regex{"\\s|[^a-z0-9']|'\\B|\\B'"};
    sregex_token_iterator iter(input.begin(), input.end(), 
            sep_regex, -1);
    sregex_token_iterator end;
    for(;iter!=end; iter++){
        string s = *iter;
        if(0== s.length())
            continue;
        auto i = word_map.find(s);
        if (i!=word_map.end()) {
            i->second++;
        } else {
            word_map.insert( {s, 1});
        }
    }    

    return word_map;
}

}  // namespace word_count
