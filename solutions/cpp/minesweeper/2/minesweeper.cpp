#include "minesweeper.h"

namespace minesweeper {
    std::vector<std::string> annotate (std::vector<std::string> input){
        std::vector<std::vector<int>> deltas{ {0,-1}, {0,1}, {-1,-1}, {-1,0}, {-1,1}, {1,-1}, {1,0}, {1,1}};
        
        int rows = input.size();
        if (0 == rows)
            return {};
        std::vector<std::string> output(rows);
        
        int cols = input[0].size();
        if (0 == cols)
            return output;
        
        for(int x = 0; x<rows; x++){
            for(int y = 0; y<cols; y++){
                if('*' == input[x][y]) 
                    output[x].push_back('*');
                else {
                    int count = 0;
                    for(auto& delta : deltas){
                        int new_x = x + delta[0];
                        int new_y = y + delta[1];
                        if(new_x >= 0 && new_x < rows && new_y >= 0 && new_y < cols) 
                            if('*' == input[new_x][new_y])
                                count++;
                    }
                    output[x].push_back(count == 0 ? ' ' : (char)count + '0');
                }
            }
        }
        return output;
    }
}  // namespace minesweeper
