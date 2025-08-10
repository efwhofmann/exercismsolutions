#include "matching_brackets.h"
#include <string>
#include <vector>

using namespace std;

namespace matching_brackets {

    bool lbrack(char c){
        return (c=='(' || c=='[' || c=='{');
    }

    bool rbrack(char c){
        return (c==')' || c==']' || c=='}');
    }

    bool complements(char l, char r){
        switch (l) {
            case '[':  return(r == ']');
            case '(':  return(r == ')');
            case '{':  return(r == '}');
            default: return false;
        }
    }

    bool check(string str){
        if (str=="")
            return true;
        vector<char> mystack;
        for(string::iterator it=str.begin(); it!=str.end(); ++it){
            if (lbrack(*it))
                mystack.push_back(*it);
            else if (rbrack(*it)){
                if (mystack.empty())
                    return false;
                char c = mystack.back();
                if (!complements(c, *it))
                    return false;
                else
                    mystack.pop_back();
            }     
        }
        return (mystack.empty());
    }

}  // namespace matching_brackets
