#include "triangle.h"

#include<stdexcept>

namespace triangle {

bool is_equilateral(double a, double b, double c)  {
    return (a == b) && (b == c);    
}

bool is_isosceles (double a, double b, double c) {
    return (a == b) || (a == c) || (b == c);    
}

bool is_scalene (double a, double b, double c) {
    return (a !=b) && (b!=c) && (c != a);    
}

bool satisfies_triangle_eq(double a, double b, double c){
   return (a+b >= c) && (b+c >= a) && (a+c >=b);
}

bool is_valid(double a, double b, double c){
    return (a>0) && (b>0) && (c>0) && satisfies_triangle_eq(a,b,c);
}

flavor kind(double a, double b, double c) {
    if (!is_valid(a,b,c)) 
        throw std::domain_error("Invalid triangle.");
    else {
        if (is_equilateral(a,b,c)) 
            return flavor::equilateral;
        else if (is_isosceles(a,b,c))
            return flavor::isosceles;
        else
            return flavor::scalene;
    }
}


}  // namespace triangle
