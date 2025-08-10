#if !defined(COMPLEX_NUMBERS_H)
#define COMPLEX_NUMBERS_H

namespace complex_numbers {

    class Complex {
            private:
                const double Re {}; 
                const double Im {};
                  
            public:
            
                Complex(const double re, const double im=0) : Re{re}, Im{im} {}
                double real() const {return Re;}
                double imag() const {return Im;}
                double abs() const;
                Complex exp() const;
                Complex conj() const {return Complex{Re, -Im};}
    
    };
    Complex operator *(const Complex& z, const Complex& w);
    Complex operator /(const Complex& z, const Complex& w);
    Complex operator +(const Complex& z, const Complex& w);
    Complex operator -(const Complex& z, const Complex& w);
    Complex operator *(const double r, const Complex& w);
    Complex operator /(const double r, const Complex& w);
    Complex operator +(const double z, const Complex& w);
    Complex operator -(const double r, const Complex& w);
    Complex operator *(const Complex& z, const double r);
    Complex operator /(const Complex& z, const double r);
    Complex operator +(const Complex& z, const double r);
    Complex operator -(const Complex& z, const double r);
    

}  // namespace complex_numbers

#endif  // COMPLEX_NUMBERS_H
