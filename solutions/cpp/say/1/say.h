#if !defined(SAY_H)
#define SAY_H
#include <string>

namespace say {
   
    std::string in_english(unsigned long);
    std::string parse_hundreds(unsigned long);
    std::string parse_tens(unsigned long);
    std::string parse_ones(unsigned long);
}  // namespace say

#endif // SAY_H