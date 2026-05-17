#include "diamond.h"

#include <string>
#include <vector>
using std::string;

namespace diamond {

    string make_row(char lt, int idx){
        int rel = lt - 'A'; 
        string outer = string(idx - rel, ' ');
        string inner = (lt == 'A') ?  "A" : 
            lt + string(2*rel-1, ' ') + lt;
        return outer+inner+outer;        
    }    
    
    std::vector<string> rows(char c){
        std::vector<string> diamond;
        int index = c-'A';
        for(auto lt='A'; lt<=c; lt++){
            diamond.push_back(make_row(lt, index));
        }
        for(int i=index-1; i>=0; i--){
            diamond.push_back(diamond.at(i));
        }        
        return diamond;
    }
}  // namespace diamond
