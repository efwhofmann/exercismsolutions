#include "high_scores.h"

#include <algorithm>

namespace arcade {

std::vector<int> HighScores::list_scores() {
    std::vector<int> result;
    std::copy(scores.begin(), scores.end(), std::back_inserter(result));
    return result;
}

int HighScores::latest_score() {
   // return *(scores.end()-1);
    return scores.back();
}

int HighScores::personal_best() {
    auto result = std::max_element(scores.begin(), scores.end());
    return *result;
}

std::vector<int> HighScores::top_three() {
    if (scores.size()==1) {return {scores.at(0)};}
    std::vector<int> list = list_scores();
    std::sort(list.begin(), list.end(), std::greater<int>());
    std::vector<int> res;
    std::copy_if(list.begin(), list.begin()+3,         std::back_inserter(res), [](int x){return x!=0;} );
    return res;
}

}  // namespace arcade
