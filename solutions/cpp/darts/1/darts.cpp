#include "darts.h"
#include <cmath>
#include <array>
using std::array;

namespace darts {
    int score(double x, double y){
        array<double,3> r_circles = {1.0,5.0,10.0};
        array<int,3> scores = {10,5,1};
        double radius = sqrt(x*x + y*y);
        int result = 0;
        
        for (int i=0; i<3; i++) {
                if (radius <= r_circles[i]) {result = scores[i]; break; }
            }
        return result;        
    }
} // namespace darts