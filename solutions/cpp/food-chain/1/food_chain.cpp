#include "food_chain.h"
#include <string>
#include <array>
#include <stdexcept>

using namespace std;

namespace food_chain {
   static string lineOne = "I know an old lady who swallowed a ";
   static string spider = " that wriggled and jiggled and tickled inside her.\n";
    static string lastLine = "I don't know why she swallowed the fly. Perhaps she'll die.\n";

    
    static array<string, 8> animals = {"fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse"};
 
    static array<string, 8> phrases = {"",
        "It wriggled and jiggled and tickled inside her.\n", 
        "How absurd to swallow a bird!\n",
        "Imagine that, to swallow a cat!\n",
        "What a hog, to swallow a dog!\n",
        "Just opened her throat and swallowed a goat!\n",
        "I don't know how she swallowed a cow!\n",
        "She's dead, of course!\n"};



  
    string verse(int no) {
        if(no<1)
           throw domain_error("Verse number must be at least one.");
        else if (no>8)
            throw domain_error("Sorry, only eight verses.");
        string res = string(lineOne);
        res += animals.at(no-1) + ".\n";
        res += phrases.at(no-1);
        if(no>1 && no<8)
            for(int idx = no-1; idx>0; idx--) {
                res += "She swallowed the " + animals.at(idx) 
                + " to catch the " + animals.at(idx-1);
                res += (idx==2) ? spider : ".\n"; }
        if(no<8)
            res += lastLine;
        return res;
    }

    string verses(int start, int end) {
        if(start<=0 || end<=0)
            throw domain_error("Verse numbers must be positive.");
        string res = string("");
        for(int i=start; i<=end; i++){
            res+= verse(i);
            res +="\n";
        }
        return res;
    }

    string sing() {
        return verses(1,8);
    }

}  // namespace food_chain
