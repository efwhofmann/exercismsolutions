#include "flower_field.h"

using namespace std;

namespace flower_field {

   vector<string> annotate (vector<string> garden){
        vector<vector<int>> deltas{ {0,-1}, {0,1}, {-1,-1}, {-1,0}, {-1,1}, {1,-1}, {1,0}, {1,1}};
        
        int rows = garden.size();
        if (0 == rows)
            return {};
        vector<string> output(rows);
        
        int cols = garden[0].size();
        if (0 == cols)
            return output;
        
        for(int x = 0; x<rows; x++){
            for(int y = 0; y<cols; y++){
                if('*' == garden[x][y]) 
                    output[x].push_back('*');
                else {
                    int count = 0;
                    for(auto& delta : deltas){
                        int new_x = x + delta[0];
                        int new_y = y + delta[1];
                        if(new_x >= 0 && new_x < rows 
                            && new_y >= 0 && new_y < cols
                            && '*' == garden[new_x][new_y])
                                count++;
                    }
                    output[x].push_back(count == 0 ? ' ' : (char)count + '0');
                }
            }
        }
        return output;
    }    

}  // namespace flower_field

