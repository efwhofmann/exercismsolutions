#include "diamond.h"

#include <string>
#include <vector>
using namespace std;

namespace diamond {
    vector<string> rows(char c){
        int m = c - 'A';
        int nr = 2*m +1;
        vector<string> diamond;
        string str;
        for(int i=0; i<nr; i++) {
            int idx = i<=m ? i : 2*m - i;
            char cur = static_cast<char>(idx + 'A');
            for(int j= -m; j<= m; j++){
                str += (j==-idx || j==idx) ? cur : ' ';
            }
            diamond.push_back(str);
            str.clear();
        }
        return diamond;
    }
}  // namespace diamond
