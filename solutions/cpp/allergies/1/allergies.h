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
        std::map<int, std::string> allergens = {
            {1, "eggs" },
            {2, "peanuts"},
            {4, "shellfish"},
            {8, "strawberries"},
            {16, "tomatoes"},
            {32, "chocolate"},
            {64, "pollen"},
            {128, "cats"}};
};

}  // namespace allergies

#endif // ALLERGIES_H