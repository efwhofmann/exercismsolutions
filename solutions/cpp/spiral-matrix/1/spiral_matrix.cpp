#include "spiral_matrix.h"

namespace spiral_matrix {
    std::vector<std::vector<uint32_t>> spiral_matrix(int n){
        std::vector<std::vector<uint32_t>> matrix(n, std::vector<uint32_t>(n));
        std::vector<std::vector<int>> deltas{ {0,1}, {1,0}, {0,-1}, {-1,0} };
        int current = 0;
        std::vector<int> pos{0,0}; 
        for(int k=1; k<=n*n; k++){
            matrix[pos[0] ][pos[1]] = k;
            int nextx = pos[0] + deltas[current][0];
            int nexty = pos[1] + deltas[current][1];
            if(nextx >= n || nextx<0 || nexty >=n || nexty <0 
                || matrix[nextx][nexty] != 0  )
            {
                 current = (current + 1) % 4;                
            }
            pos[0] += deltas[current][0];
            pos[1] += deltas[current][1];
        }
        return matrix;
    }
}  // namespace spiral_matrix
