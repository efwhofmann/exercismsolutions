#if !defined(GRADE_SCHOOL_H)
#define GRADE_SCHOOL_H

#include <map>
#include <vector>
#include <string>

namespace grade_school {

    class school {
        private:
           std::map<int, std::vector<std::string>> roster_;

        public:
            school() = default;
            void add(std::string, int);
            const std::map<int, std::vector<std::string>> &roster() const;
            const std::vector<std::string> grade(int) const;     
    };
    
}  // namespace grade_school

#endif // GRADE_SCHOOL_H