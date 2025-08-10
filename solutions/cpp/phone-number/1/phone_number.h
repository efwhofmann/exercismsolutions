#if !defined(PHONE_NUMBER_H)
#define PHONE_NUMBER_H
#include<string>

namespace phone_number {

    class phone_number {
        public: 
            phone_number(std::string);
            std::string number();
        private:
            std::string the_number;
            bool validate_clean(std::string);
    };    
}  // namespace phone_number

#endif // PHONE_NUMBER_H