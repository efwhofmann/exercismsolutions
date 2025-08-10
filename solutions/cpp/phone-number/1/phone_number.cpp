#include "phone_number.h"

#include <string>
#include <regex>
#include <stdexcept>
#include <iostream>

using namespace std;

namespace phone_number {

        bool phone_number::validate_clean(string no){
            unsigned int len = no.length();
            if(len > 11 || len <10)
                return false;
            else if(len == 11 && no.at(0)!='1')
                return false;
            else if(no.at(len-10)-'0'<2)
                return false;
            else if(no.at(len-7) - '0'<2)
                return false;
            else 
                return true;
        }   
    

        phone_number::phone_number (string input){
            regex non_digits("\\D");
            string clean = regex_replace(input, non_digits,"");
            unsigned int len = clean.length();
            
            /* regex not_allowed("[^\\d-+.()\\s]"); 
            if(regex_search(input, not_allowed)){
                throw domain_error("Punctuation not allowed");                          }*/
        
            if (!validate_clean(clean))
                throw domain_error("Invalid number");                       
            this->the_number = clean.substr(len-10);
        }

        string phone_number::number() {
            return the_number;
        }
    
}  // namespace phone_number
