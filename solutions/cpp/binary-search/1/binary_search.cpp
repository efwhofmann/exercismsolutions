#include "binary_search.h"
#include <vector>
#include <stdexcept>
#include <cstddef>

using namespace std;

namespace binary_search {

    size_t find(vector<int> data, int key){
        int high= data.size()-1;
        int low = 0u;
        while(low <= high){
            int mid = (low + high)/2;
            if(data.at(mid) == key) 
                return mid;
            else 
                if(data.at(mid)<key)
                    low = mid+1;
                else // (data.at(mid)>key)
                    high = mid-1;
            }          
        throw std::domain_error("Not found.");
    }

}  // namespace binary_search
