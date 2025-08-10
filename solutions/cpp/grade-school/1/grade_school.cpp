#include "grade_school.h"

#include <map>
#include <algorithm>
#include <vector>
#include <string>

using namespace std;

namespace grade_school {

    void school::add(string student, int grade){
        roster_[grade].push_back(student);   
        std::sort(roster_[grade].begin(), roster_[grade].end());
    }

    const vector<string> school::grade(int g) const {
        return roster_.find(g)->second;
    }

    const map<int, vector<string>> &school::roster() const {
        return roster_;
    }

    
    
}  // namespace grade_school
