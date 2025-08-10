#include "pascals_triangle.h"

#include <vector>

using namespace std;

namespace pascals_triangle {

std::vector<std::vector<int>> generate_rows(int range){
    std::vector<std::vector<int>> pascal;
    if (!range) 
        return pascal;
    pascal.emplace_back(vector<int>{1});
    for(int r=1; r<range; r++){
        vector<int> row_r;
        for(int k=0; k<=r; k++){
            int coeff_rk;
            if ((!k) || (k==r))
                coeff_rk = 1;
            else 
               coeff_rk = (pascal.at(r-1)).at(k-1) + (pascal.at(r-1)).at(k);     
           row_r.emplace_back(coeff_rk);
        }
        pascal.emplace_back(row_r);
    }
    return pascal;
}

}  // namespace pascals_triangle
