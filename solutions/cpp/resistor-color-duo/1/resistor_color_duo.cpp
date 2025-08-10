#include "resistor_color_duo.h"

#include <map>
#include <stdexcept>
using namespace std;

namespace resistor_color_duo {

        const map<string, int> resistor_map = {
            {"black",0}, {"brown",1}, 
            {"red",2}, {"orange", 3},
            {"yellow", 4}, {"green", 5},
            {"blue", 6}, {"violet", 7},
            {"grey", 8}, {"white", 9}
        };

        int value(vector<string> colors) {
            auto v1 = resistor_map.find(colors[0]);
            auto v2 = resistor_map.find(colors[1]);
            if(v1!=resistor_map.end() && v2!=resistor_map.end()){
                return 10*(v1->second) + v2->second;
            } else {
                throw std::invalid_argument("Invalid input.");
            }
        }

        
}  // namespace resistor_color_duo
