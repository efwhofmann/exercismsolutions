#include "resistor_color.h"
#include<stdexcept>

using namespace std;

namespace resistor_color {

     vector<string> const _colors{"black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"};

    int color_code(string color){
        for(auto i=0;i<10; i++){
            if(color == _colors.at(i))
                return i;
        }
        throw std::invalid_argument("Invalid color.");
    }
    
    vector<string> colors() {return _colors;};
    

}  // namespace resistor_color
