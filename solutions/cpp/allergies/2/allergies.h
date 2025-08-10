#if !defined(ALLERGIES_H)
#define ALLERGIES_H

#include<string>
#include<map>
#include<unordered_set>

namespace allergies {

class allergy_test {
    public: 
        allergy_test(int); 
        bool is_allergic_to(std::string);
        std::unordered_set<std::string> get_allergies();   
    private:
        int key;
        std::map<std::string, int> allergens = {
            {"eggs", 1},
            {"peanuts", 2},
            {"shellfish", 1<<2},
            {"strawberries", 1<<3},
            {"tomatoes", 1<<4},
            {"chocolate", 1<<5},
            {"pollen", 1<<6},
            {"cats", 1<<7}};
};

}  // namespace allergies

#endif // ALLERGIES_H