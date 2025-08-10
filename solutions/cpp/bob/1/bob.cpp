#include "bob.h"

#include <string>
#include <array>
#include <regex>

using namespace std;

namespace bob {

    array<string, 5> responses = {
        "Sure.", "Whoa, chill out!", "Calm down, I know what I'm doing!",  "Fine. Be that way!", "Whatever."     };

    bool is_question(string input) {
        regex pattern("\\s+");
        string str = regex_replace(input, pattern, "");
        return str.back() == '?';
    }

    bool is_yelling(string input){
        return !regex_search(input, regex("[a-z]")) && regex_search(input, regex("[A-Z]"));
    }

    Intent classify_input(string input){
        if(!regex_search(input,regex("\\S")))
            return Intent::Silence;
        bool is_q = is_question(input);       
        bool is_y = is_yelling(input);
        if (is_q && is_y) 
                    return Intent::YellQuestion;
        else if (is_q)
                 return Intent::Question;
        else if (is_y)
            return Intent::Yell;
        else
            return Intent::AllElse;
    }

    string hey (string input) {
        return responses.at(
            static_cast<int>(classify_input(input)));
    }
    
}  // namespace bob
