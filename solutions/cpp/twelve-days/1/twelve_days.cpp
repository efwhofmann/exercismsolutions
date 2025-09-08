#include "twelve_days.h"

#include <array>

using namespace std; 

namespace twelve_days {

static array<string, 12> day_numbers = {"first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth" };
static array<string, 12> gifts = {"a Partridge in a Pear Tree",
"two Turtle Doves", "three French Hens", "four Calling Birds", "five Gold Rings", "six Geese-a-Laying", 
"seven Swans-a-Swimming", "eight Maids-a-Milking",
"nine Ladies Dancing", "ten Lords-a-Leaping",
"eleven Pipers Piping", "twelve Drummers Drumming"};

string stanza(unsigned int number) {
    string first_line{};
    string all_gifts{};
    first_line += "On the " + day_numbers.at(number-1) + " day of Christmas my true love gave to me: ";
    if(number==1) 
        all_gifts+= gifts.at(0);
    else {        
        for(unsigned int idx = 1; idx<=number-1; idx++) {
            all_gifts = gifts.at(idx) + ", " + all_gifts; 
        }
        all_gifts += "and " + gifts.at(0);
    }
    return first_line + all_gifts + ".\n";
}

string recite(unsigned int from, unsigned int to) {
    string output{};
    bool several = (from!=to);
    for(auto i=from; i<=to; i++)
        output+=stanza(i) + (several && i!=to? "\n" : "");

    return output;
}

    
}  // namespace twelve_days
