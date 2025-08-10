#pragma once

namespace space_age {

class space_age {
    private:
        long int _seconds;
    public:
        space_age(long int secs){_seconds = secs;};
        long int  seconds() const {return _seconds;};
        double on_mercury() const;
        double on_venus() const;
        double on_earth() const;
        double on_mars() const;
        double on_jupiter() const;
        double on_saturn() const;
        double on_uranus() const;
        double on_neptune() const;                
};

}  // namespace space_age
