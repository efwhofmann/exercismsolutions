#include "rational_numbers.h"
#include <stdlib.h>
#include <math.h>

int16_t gcd(int16_t, int16_t);
int16_t lcm(int16_t, int16_t);
rational_t adjust_sign(rational_t);
rational_t invert(rational_t);


int16_t intexp(int16_t, int16_t);

int16_t gcd(int16_t p, int16_t q){
    if(!p)
        return q;
    while(q>0) {
        int16_t t=q;
        q = p % q;
        p = t;
    }
    return p;
}

rational_t adjust_sign(rational_t r){
    if((r.denominator < 0 && r.numerator > 0)
           || (r.denominator <0 && r.numerator <0)){
        rational_t res = {-r.numerator, -r.denominator};
        return res;
    }
    else
        return r;
}

rational_t invert(rational_t r){
    rational_t res = {r.denominator, r.numerator};
    return res;
}

rational_t reduce(rational_t r) {
    int16_t d = gcd(abs(r.denominator), abs(r.numerator));
    r.numerator /= d;
    r.denominator /= d;
    return adjust_sign(r);
}

rational_t add(rational_t r1, rational_t r2){
    int16_t newd = r1.denominator * r2.denominator;
    int16_t newn = r1.numerator*r2.denominator
       + r2.numerator*r1.denominator;
    rational_t res = {newn, newd};
    return reduce(res);
}

rational_t subtract(rational_t r1, rational_t r2){
    rational_t minusone = {-1,1};
    return add(r1, multiply(r2, minusone));
}

rational_t multiply(rational_t r1, rational_t r2) {
    rational_t res = {r1.numerator*r2.numerator, r1.denominator*r2.denominator};
    return reduce(res);
}

rational_t divide(rational_t r1, rational_t r2){
    return multiply(r1, invert(r2));
}

rational_t absolute(rational_t r){
    rational_t res = {abs(r.numerator), abs(r.denominator)};
    return reduce(res);
}

int16_t intexp(int16_t b, int16_t e){
    if (!b)
        return 0;
    else if (1==b)
        return 1;
    int16_t p = b;
    int16_t r = 1;
    while(e>0) {
        if(e%2 == 1) 
            r *=p;
        p *=p;
        e /=2;
    }
    return r;
}

rational_t exp_rational(rational_t r, int16_t n){
    if(n<0)
        return exp_rational(invert(r), -n);
    else {
        rational_t res =  {intexp(r.numerator,n), intexp(r.denominator,n)};
        return adjust_sign(res);
    }
}

double exp_real(double x, rational_t r){
    double q  = ((double)r.numerator )/ ((double) r.denominator);
    return pow(x, q);
}