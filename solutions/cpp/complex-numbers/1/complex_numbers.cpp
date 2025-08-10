#include "complex_numbers.h"
#include <cmath>

namespace complex_numbers {

    double Complex::abs() const {
        return std::sqrt(Re*Re + Im*Im);
    }

    Complex Complex::exp() const {
        double r = std::exp(Re);
        return Complex{r*std::cos(Im),r*std::sin(Im)};
    }

    Complex operator *(const Complex& z, const Complex& w){
    return Complex{z.real()*w.real() - z.imag()*w.imag(),
        z.real()*w.imag() + z.imag()*w.real()};
    }
    
    Complex operator /(const Complex& z, const Complex& w){
        auto d = w.real()*w.real() + w.imag()*w.imag();
        return Complex{1.0/d,0}*(z*w.conj());
    }
    
    Complex operator +(const Complex& z, const Complex& w){
        return Complex{z.real() + w.real(), z.imag() + w.imag()};    
    }
    
    Complex operator -(const Complex& z, const Complex& w){
         return Complex{z.real() - w.real(), z.imag() - w.imag()};
    }
    
    Complex operator *(const double r, const Complex& w){
        return Complex{r*w.real(), r*w.imag()};   
    }
    
    Complex operator /(const double r, const Complex& w){
        auto d =  w.real()*w.real() + w.imag()*w.imag();
        return (r/d)*w.conj();   
    }
    
    Complex operator +(const double r, const Complex& w){
        return Complex{w.real()+r, w.imag()};    
    }
    
    Complex operator -(const double r, const Complex& w){
         return Complex{r-w.real(), -w.imag()};
    }
    
    Complex operator *(const Complex& z, const double r){
        return Complex{r*z.real(), r*z.imag()};    
    }
    
    Complex operator /(const Complex& z, const double r){
        return Complex{z.real()/r, z.imag()/r};
    }
    
    Complex operator +(const Complex& z, const double r){
        return (r+z);
    }
    
    Complex operator -(const Complex& z, const double r){
        return Complex{z.real()-r, z.imag()};
    }
  

}  // namespace complex_numbers
