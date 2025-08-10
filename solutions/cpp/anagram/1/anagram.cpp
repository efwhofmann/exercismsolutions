#include "anagram.h"

#include <string>
#include <vector>
#include <boost/algorithm/string/case_conv.hpp>
#include <map>

using namespace std;


namespace anagram {

    map<char,int> anagram::letter_map (string some_word){
        map<char,int> lt_map;
        for(string::iterator it=some_word.begin(); it!=some_word.end(); ++it){
            if(isalpha(*it))
                lt_map[*it]++;            
        }
        return lt_map;
    }

    anagram::anagram(string wd) {
        word = boost::to_lower_copy(wd);
        word_letters = letter_map(word);
        }  
    
    vector<string> anagram::matches(vector<string> const& candidates){
        vector<string> result;
        
        for(unsigned int i=0; i<candidates.size(); i++){
            string cand = boost::to_lower_copy(candidates.at(i));
            if(cand != word)
                if(letter_map(cand) == word_letters)
                    result.push_back(candidates.at(i));
        }
        return result;
    }



}  // namespace anagram
