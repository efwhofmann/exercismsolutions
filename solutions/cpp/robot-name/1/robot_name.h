#pragma once

#include <string>
#include <unordered_set>

namespace robot_name {
    class robot {
        public:
            robot();
            std::string name() const;
            void reset();
        private:
            std::string myName;
            std::string generateName();
            std::unordered_set<std::string> existingNames{};
    };
}  // namespace robot_name
