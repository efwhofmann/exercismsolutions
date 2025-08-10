#include "minesweeper.h"

namespace minesweeper {
    std::vector<std::string> annotate (std::vector<std::string> input){
        
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
                    if(y>0 && '*' == input[x][y-1]) 
                        count++;
                    if(y+1 < cols && '*' == input[x][y+1]) 
                        count++;                                
                    if(x>0) {
                        if('*' == input[x-1][y]) 
                            count++;
                        if(y>0 && '*' == input[x-1][y-1]) 
                            count++;
                        if(y+1 < cols && '*' == input[x-1][y+1])
                            count++;                          }
                    if(x+1<rows) {
                       if('*' == input[x+1][y]) 
                           count++;
                       if(y>0 && '*' == input[x+1][y-1]) 
                           count++;
                       if(y+1 < cols && '*' == input[x+1][y+1]) 
                           count++;                           }
                    output[x].push_back(count == 0 ? ' ' : (char)count + '0');
                }
            }
        }
        return output;
    }
}  // namespace minesweeper
