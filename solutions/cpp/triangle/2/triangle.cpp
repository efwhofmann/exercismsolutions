#include "triangle.h"

#include<vector>
#include<algorithm>
#include<stdexcept>

namespace triangle {

bool is_valid(std::vector<double> edges){
    return (edges.at(0)>0) && (edges.at(0)+edges.at(1)>= edges.at(2));
}

flavor kind(double a, double b, double c) {
    std::vector<double> edges{a,b,c};
    std::sort(edges.begin(), edges.end());
    if ( !is_valid(edges))
        throw std::domain_error("Invalid triangle.");
    else {
        if (edges.at(0)==edges.at(2)) 
            return flavor::equilateral;
        else if (edges.at(0)==edges.at(1) 
            || edges.at(1) == edges.at(2))
            return flavor::isosceles;
        else
            return flavor::scalene;
    }
}


}  // namespace triangle
