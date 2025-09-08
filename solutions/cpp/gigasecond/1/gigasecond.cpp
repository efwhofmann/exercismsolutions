#include "gigasecond.h"

using namespace boost::posix_time;

namespace gigasecond {

ptime advance(const ptime &dob) {
    return dob + seconds(1'000'000'000);    
}
    
}  // namespace gigasecond
