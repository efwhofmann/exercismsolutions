#include "roman_numerals.h"
#include <string>
#include <array>
#include <stdexcept>

using namespace std;

namespace roman_numerals {

    struct arabic_to_roman{
        int arabic;
        string roman;        
    };

    array<arabic_to_roman,13> a_to_r={{
{1000,"M"}, {900,"CM"}, {500,"D"}, {400,"CD"},          {100,"C"}, {90,"XC"}, {50,"L"}, {40,"XL"},
         {10, "X"},{9, "IX"}, {5, "V"}, {4, "IV"},
         {1, "I"}}};
    
    string convert(int number){
        string result="";
        if (number <=0 )
            throw invalid_argument("Must be >0.");
        else{
            for(size_t i=0; i<a_to_r.size(); ++i){
                while(number>= a_to_r.at(i).arabic){
                    result += a_to_r.at(i).roman;
                    number -= a_to_r.at(i).arabic;
                }
            }
         }
         return result;
    }
}  // namespace roman_numerals
