#include "say.h"
#include <string>
#include <stdexcept>
#include <array>

using namespace std;

namespace say {

     const array<string,4> power_names = {"hundred","thousand", "million", "billion"};
    const array<string,8> tens = {"twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"};
    const array<string,10> teens = {"ten", "eleven", "twelve", "thireen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"};
    const array<string,9> ones = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine"};

    string parse_ones(unsigned long number) {
        if(number<1 || number>9)
            return "";
        return ones.at(number-1); 
    } 
    
    string parse_tens(unsigned long number) {
        unsigned long d = number/10;
        unsigned long r = number%10;
        switch(d) {
            case 0: return parse_ones(r);
                    break;
            case 1: return teens.at(r);
                    break;
            default: 
                string s1 = tens.at(d-2);
                if(r == 0)
                    return s1;
                else
                    return s1 + string("-") +  parse_ones(r);                    
        }
    }
    
    string parse_hundreds(unsigned long number) {      
        unsigned long d = number/100;
        unsigned long r = number%100;
        if(!d) 
            return parse_tens(r);
        else 
            {
                string sr = (r!=0)?  string(" ") + parse_tens(r): string("");
                return parse_ones(d) + string(" ") + power_names.at(0) + sr;
            }
            
    }
    
    string in_english(unsigned long number) {
        string result; 
        if(!number)
            return string("zero");
        else if (number>= 1000ULL*1000ULL*1000ULL*1000ULL)
            throw domain_error("Unsuported input.");
        string pad_previous = "";
        for(size_t i = 0; i<power_names.size() &&  number>0; i++) {
            auto r = number % 1000ULL;
            string s = parse_hundreds(r);
            if(i && s!="")  
                s += " " + power_names.at(i);
            result = s + pad_previous + result; 
            pad_previous = (r!=0) ? " " : "";
            number = (number - r)/1000ULL;            
        }
        return result;            
    }
    

}  // namespace say
