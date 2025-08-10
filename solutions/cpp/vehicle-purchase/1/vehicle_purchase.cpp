#include "vehicle_purchase.h"
#include <string>

namespace vehicle_purchase {

    // needs_license determines whether a license is needed to drive a type of vehicle. Only "car" and "truck" require a license.
    bool needs_license(std::string kind){
        bool result = false;
        if (kind=="car" || kind=="truck") {
            result = true; }
        return result;
    }

    // choose_vehicle recommends a vehicle for selection. It always recommends the vehicle that comes first in lexicographical order.
    std::string choose_vehicle(std::string option1, std::string option2) {
        // TODO: Return the final decision in a sentence.
        std::string  my_choice= (option1 <= option2) ? option1 : option2;
        return my_choice + " is clearly the better choice.";
    }

    // calculate_resell_price calculates how much a vehicle can resell for at a certain age.
    double calculate_resell_price(double original_price, double age) {
        double factor;
        if (age<3) {factor = 0.8;} 
        else if ((3<= age) && (age < 10)) {factor = 0.7;} 
        else {factor = 0.5;}
        return original_price*factor;
    }

}  // namespace vehicle_purchase