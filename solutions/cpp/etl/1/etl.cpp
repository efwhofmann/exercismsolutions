#include "etl.h"

using namespace std;

#include <string>

namespace etl {

map<char, int> transform(map<int, vector<char>> old){
    map<char, int> res;
    for( map<int,vector<char>>::iterator iter=old.begin(); iter!=old.end(); ++iter){
        for(char ch : iter->second){
            res.insert({tolower(ch), iter->first}); 
        }
    }
    return res;
}

}  // namespace etl
