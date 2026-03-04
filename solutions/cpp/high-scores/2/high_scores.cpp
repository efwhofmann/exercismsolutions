#include "high_scores.h"

#include <algorithm>

using namespace std;

namespace arcade {

vector<int> HighScores::list_scores() {
    return scores;
}

int HighScores::latest_score() {
   return scores.back();
}

int HighScores::personal_best() {
    return *max_element(scores.begin(), scores.end());
}

vector<int> HighScores::top_three() {
    vector<int> res(min(size_t{3}, scores.size()));
    partial_sort_copy(
        scores.begin(), scores.end(),                                     res.begin(), res.end(), 
        greater<int>());
    return res;
}

}  // namespace arcade
