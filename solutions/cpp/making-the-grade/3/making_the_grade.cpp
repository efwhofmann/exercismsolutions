#include <array>
#include <string>
#include <vector>
#include <algorithm>

using namespace std;

constexpr int max_failing_score = 40;

// Round down all provided student scores.
vector<int> round_down_scores(vector<double> student_scores) {
    // not really shorter than a loop cf. previous iteration
    vector<int> res(student_scores.size(), 0);
    transform(student_scores.begin(), student_scores.end(),res.begin(),
        [](auto score) ->
        int {return static_cast<int>(score);});
    return res;
}


// Count the number of failing students out of the group provided.
int count_failed_students(vector<int> student_scores) {
    return static_cast<int>(
        count_if(student_scores.begin(), student_scores.end(),
        [](int score){return score<=max_failing_score;}));
}

// Determine how many of the provided student scores were 'the best' based on the provided threshold.
/* vector<int> above_threshold(vector<int> student_scores, int threshold) {
    vector<int> res;
    for(size_t i=0; i!=student_scores.size(); ++i){            
        if(student_scores.at(i)>=threshold)
            res.emplace_back(student_scores.at(i));}
    return res;
} */

// Create a list of grade thresholds based on the provided highest grade.
array<int, 4> letter_grades(int highest_score) {
    int delta = (highest_score - max_failing_score)/4;
    return {max_failing_score + 1, (max_failing_score+delta) + 1, 
        (max_failing_score + 2*delta) + 1, 
        (max_failing_score + 3*delta) + 1};
}

// Organize the student's rank, name, and grade information in ascending order.
vector<std::string> student_ranking(vector<int> student_scores, vector<string> student_names) {
    vector<string> res; 
    for (size_t i=0; i!=student_scores.size(); ++i) {
            string entry = to_string(i+1) + ". " 
                        + student_names.at(i) + ": "
                        + to_string(student_scores.at(i));
            res.emplace_back(entry);        
    }
    return res;
}

// Create a string that contains the name of the first student to make a perfect score on the exam.
string perfect_score(vector<int> student_scores, vector<string> student_names) {
  for(size_t i=0; i!=student_scores.size(); ++i){
       if (student_scores.at(i)==100)
           return student_names.at(i);}
    return "";
}