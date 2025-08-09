#include "triangle.h"

bool is_valid(triangle_t t){
    bool triangle_eq = (t.a+t.b >= t.c && 
                        t.a+t.c >= t.b && t.b+t.c >=t.a);
    return (t.a>0) && (t.b>0) && (t.c>0)  && triangle_eq;    
}


bool is_equilateral(triangle_t t){
    return is_valid(t) && (t.a == t.b && t.b == t.c);
}

bool is_isosceles(triangle_t t){
    return is_valid(t) && (t.a == t.b || t.b == t.c || t.a == t.c);
}

bool is_scalene(triangle_t t){
    return is_valid(t) && (t.a != t.b && t.b != t.c && t.c != t.a);
}

