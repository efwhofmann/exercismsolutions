#include "allergies.h"

#include<string>
#include<unordered_set>

using namespace std; 
namespace allergies {

allergy_test::allergy_test(int k) : key{k} {}

bool allergy_test::is_allergic_to(string allergen) {
    map<int,string>::iterator it;
    for(it=allergens.begin(); it!=allergens.end(); it++)  {
        if (it->second == allergen) 
            return (it->first & key);
    }  
    return false;
}

unordered_set<string> allergy_test::get_allergies() {
    unordered_set<string> a_set;
    map<int,string>::iterator it;
    for(it=allergens.begin(); it!=allergens.end(); it++)  {
        if (it->first & key) 
            a_set.insert(it->second);
    } 
    return a_set;
}


}  // namespace allergies
