#include "allergies.h"

#include<string>
#include<unordered_set>

using namespace std; 
namespace allergies {

allergy_test::allergy_test(int k) : key{k} {}

bool allergy_test::is_allergic_to(string allergen) {
     for(auto& al : allergens)  {
        if (al.first == allergen) 
            return (al.second & key);
    }  
    return false;
}

unordered_set<string> allergy_test::get_allergies() {
    unordered_set<string> a_set;
    for(auto& al : allergens)  {
        if (al.second & key) 
            a_set.insert(al.first);
    } 
    return a_set;
}


}  // namespace allergies
