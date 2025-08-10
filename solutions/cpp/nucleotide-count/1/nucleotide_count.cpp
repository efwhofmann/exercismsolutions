#include "nucleotide_count.h"

#include <stdexcept>

using namespace std;

namespace nucleotide_count {

    map<char,int> count(string strand) {

        map<char,int> nuc_counts = {
            {'A', 0}, {'C', 0}, {'G', 0}, {'T', 0}
        };
        for(auto ch : strand){
            auto it = nuc_counts.find(ch);
            if (it == nuc_counts.end())
                throw invalid_argument("Invalid input.");
            it->second++;
        }
        return nuc_counts;
    }

}  // namespace nucleotide_count
