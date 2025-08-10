#include "two_fer.h"
#include <string>
using namespace std;

namespace two_fer
{
    string two_fer(string name)
    {
        return "One for " + name + ", one for me.";        
    }
    string two_fer(){
        return two_fer("you");
    }
} // namespace two_fer

