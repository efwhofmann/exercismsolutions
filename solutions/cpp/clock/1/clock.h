#pragma once

#include <string>

namespace date_independent {

class clock {
    private:
        int mm{};
        int hh{};
        
        clock(int h, int m);
    public:
        clock plus(int add);
        clock minus(int sub);
        static clock at(int hour, int minute);
        bool operator==(const clock& other) const;
        bool operator!=(const clock& other) const;
        operator std::string() const;

    
};

}  // namespace date_independent
