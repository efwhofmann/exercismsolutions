#if !defined(BOB_H)
#define BOB_H

#include <string>

namespace bob {

    enum class Intent {
        Question,
        Yell,
        YellQuestion,
        Silence,
        AllElse
    }; 

    bool is_question(std::string);
    bool is_yelling(std::string);

    Intent classify_input(std::string input);

    std::string hey(std::string input);

}  // namespace bob

#endif // BOB_H