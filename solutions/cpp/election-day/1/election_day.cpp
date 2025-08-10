#include <string>
#include <vector>
#include <cstddef>
#include <algorithm> 

namespace election {

// The election result struct is already created for you:

struct ElectionResult {
    // Name of the candidate
    std::string name{};
    // Number of votes the candidate has
    int votes{};
};

// TODO: Task 1
// vote_count takes a reference to an `ElectionResult` as an argument and will
// return the number of votes in the `ElectionResult.
int vote_count(ElectionResult& result){
    return result.votes;    
}


// TODO: Task 2
// increment_vote_count takes a reference to an `ElectionResult` as an argument
// and a number of votes (int), and will increment the `ElectionResult` by that
// number of votes.
void increment_vote_count(ElectionResult& res, int num_votes){
    res.votes += num_votes;
}


// TODO: Task 3
// determine_result receives the reference to a final_count and returns a
// reference to the `ElectionResult` of the new president. It also changes the
// name of the winner by prefixing it with "President". The final count is given
// in the form of a `reference` to `std::vector<ElectionResult>`, a vector with
// `ElectionResults` of all the participating candidates.
bool my_sorting (ElectionResult& a, ElectionResult& b){
    return(a.votes > b.votes);
}

ElectionResult&  determine_result(std::vector<ElectionResult>& the_results){
    std::sort(the_results.begin(), the_results.end(),my_sorting);
    ElectionResult& the_winner = the_results.at(0);
    the_winner.name = "President " + the_winner.name;
    return the_winner;
}

}  // namespace election