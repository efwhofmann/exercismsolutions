#if !defined(ANAGRAM_H)
#define ANAGRAM_H

#include <string>
#include <vector>
#include <array>
#include <map>

using namespace std;

namespace anagram {
class anagram { 
 private:
    string word;
    map<char,int> word_letters;
    map<char, int> letter_map (string);

 public:
     anagram(string); 
     vector<string> matches(vector<string> const& cadidates);
};


}  // namespace anagram

#endif // ANAGRAM_H