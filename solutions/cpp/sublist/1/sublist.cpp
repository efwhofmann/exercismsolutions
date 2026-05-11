#include "sublist.h"
#include <vector>
#include <algorithm>

namespace sublist {

bool is_sublist(const std::vector<int>& shorter, const std::vector<int>& longer){
        auto it_last = end(longer) -  size(shorter)+1;
        for (auto it=begin(longer); it!=it_last; ++it){
            if(std::equal(begin(shorter), end(shorter),it))
                return true;
        }
    return false;
}    
   
sublist::List_comparison sublist(const std::vector<int> &one, const std::vector<int> &two){
    List_comparison result;
    if (size(one)<size(two) && is_sublist(one,two)) 
        result = List_comparison::sublist;
    else if (size(one)>size(two) && is_sublist(two,one)) 
        result = List_comparison::superlist;
    else if (one==two) 
        result = List_comparison::equal;
    else
        result = List_comparison::unequal;
    return result;    
}
    
}  // namespace sublist
