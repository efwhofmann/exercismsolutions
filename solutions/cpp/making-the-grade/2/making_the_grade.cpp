#include <array>
#include <string>
#include <vector>

using namespace std;

// Round down all provided student scores.
std::vector<int> round_down_scores(std::vector<double> student_scores) {
    vector<int> res;
    for (size_t i=0; i!=student_scores.size(); ++i) 
        res.push_back(int(student_scores.at(i)));
    return res;
}


// Count the number of failing students out of the group provided.
int count_failed_students(std::vector<int> student_scores) {
    int n=0;
    for (size_t i=0; i!=student_scores.size(); ++i)
       if (student_scores.at(i)<=40)
           n++;
    return n;
}

// Determine how many of the provided student scores were 'the best' based on the provided threshold.
std::vector<int> above_threshold(std::vector<int> student_scores, int threshold) {
    vector<int> res;
    for(size_t i=0; i!=student_scores.size(); ++i){            
        if(student_scores.at(i)>=threshold)
            res.emplace_back(student_scores.at(i));}
    return res;
}

// Create a list of grade thresholds based on the provided highest grade.
std::array<int, 4> letter_grades(int highest_score) {
    int failed_score = 40;
    int delta = (highest_score - failed_score)/4;
    return {failed_score + 1, (failed_score+delta) +1, 
        (failed_score + 2*delta) +1, 
        (failed_score + 3*delta) +1};
}

// Organize the student's rank, name, and grade information in ascending order.
std::vector<std::string> student_ranking(std::vector<int> student_scores, std::vector<std::string> student_names) {
    vector<string> res; 
    for (size_t i=0; i!=student_scores.size(); ++i) {
            string entry = to_string(i+1) + ". " + student_names.at(i)+ 
                    ": " + to_string(student_scores.at(i));
            res.emplace_back(entry);        
    }
    return res;
}

// Create a string that contains the name of the first student to make a perfect score on the exam.
std::string perfect_score(std::vector<int> student_scores, std::vector<std::string> student_names) {
    for(size_t i=0; i!=student_scores.size(); ++i)
        if (student_scores.at(i)==100)
            return student_names.at(i);
    return "";
}