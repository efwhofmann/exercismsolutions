#include "robot_name.h"

#include <random>
#include <iostream>
using namespace std;

namespace robot_name {

    robot::robot() {
        myName = generateName();
        existingNames.insert(myName);
    }

    string robot::name() const {
        return myName;
    }

    void robot::reset() {
        string newName;
        bool name_is_new=false;
        while (!name_is_new) {
            newName = generateName();
            name_is_new = !(newName == myName) &&
            (existingNames.count(newName) == 0);
         }
        existingNames.insert(newName);
        myName = newName;
    }

    string robot::generateName() {
        random_device rd;
        mt19937 gen(rd());
        uniform_int_distribution letters(0,25);
        uniform_int_distribution digits(0,9);
        string capitalLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        string newName = capitalLetters.substr(letters(gen),1)
                + capitalLetters.substr(letters(gen),1)
                + to_string(digits(gen))
                + to_string(digits(gen))
                + to_string(digits(gen));
        return newName;
    }
    
}  // namespace robot_name
