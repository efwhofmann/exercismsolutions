#include "clock.h"

namespace date_independent {

clock::clock(int hours, int minutes){
    int min = minutes%60;
    if (min<0)
        min += 60;
    mm = min;
    if(minutes<0 && (minutes % 60 != 0))
        hours +=  minutes/60 - 1;
    else
        hours += minutes/60;
    hours %= 24;
    if (hours<0) hours += 24;
    hh = hours;    
}

clock clock::at(int hours, int minutes){
    return clock(hours, minutes);
}

bool clock::operator==(const clock& other) const {
    return other.hh == hh && other.mm == mm;
}

bool clock::operator!=(const clock& other) const {
    return other.hh != hh || other.mm != mm;
}    

clock::operator std::string() const {
  return (hh<10 ? "0" : "") + std::to_string(hh)+ ":" + 
    (mm<10 ? "0" : "") +std::to_string(mm);
}

clock clock::plus(int add){
    return clock(hh, mm+add);
}

clock clock::minus(int sub){
    return clock(hh, mm - sub);
}
        

          

}  // namespace date_independent
