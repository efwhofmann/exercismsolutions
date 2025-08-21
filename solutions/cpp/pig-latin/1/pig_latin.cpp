#include "pig_latin.h"

#include <regex>
#include <iostream>

using namespace std;

namespace pig_latin {

    string translate(string english) {
        string pig("");
        regex words(R"(\w+)");
        sregex_iterator it(english.begin(), 
                     english.end(), words), end;
        for(;it!=end; it++) {            
            pig+=piggyfy((*it).str()) + " ";         
        }
        if(pig.back()==' ') 
            pig.pop_back();
        return pig;
    }

    
    string piggyfy(string e_word){
        regex vowels(R"(^([aeiou]|yt|xr)(\w*))");
        regex qu_regex(R"(([^aeiou]*[q][u])(\w*))");
        regex y_regex(R"(([^aeiouy]+)(y\w*))");
        regex cons_regex(R"(([^aeiou]+)([aeiou]\w*))");
        smatch sm;
        if (regex_search(e_word, sm, vowels)) 
            return e_word+"ay";
        else if(regex_match(e_word, sm, qu_regex))
            return sm[2].str() + sm[1].str()+"ay";
        else if(regex_match(e_word, sm, y_regex))
            return  sm[2].str()+ sm[1].str() + "ay";
        else if(regex_match(e_word, sm, cons_regex))
            return  sm[2].str()+ sm[1].str() + "ay";
        
        return e_word;
    }

    

}  // namespace pig_latin
