#include "yacht.h"

#include <map>
#include <algorithm>
#include <stdexcept>

using namespace std;

namespace yacht {

int count_my_number(list<int> dice, int n) {
    int counter = 0;
    for(int d : dice){
        counter += d==n ? 1 : 0;
    }
    return counter;
}
    
int score_by_number(list<int> dice, int n) {
     return count_my_number(dice, n)*n;
}

int score_yacht(list<int> dice){
    return count_my_number(dice, dice.front()) == 5 ? 50 : 0;
}

int score_lt_straight(list<int> dice){
    dice.sort();
    return dice==list<int>{1,2,3,4,5} ? 30 : 0;
}

int score_big_straight(list<int> dice){
    dice.sort();
    return dice==list<int>{2,3,4,5,6} ? 30 : 0;
}

int score_choice(list<int> dice){
    int sum = 0;
    for(int d : dice){
        sum += d;
    }
    return sum;
}

int score_full_house(list<int> dice){
    dice.sort();
    int a = count_my_number(dice, dice.front());
    int b = count_my_number(dice, dice.back());
    return ((a==2 && b==3) || (a==3 && b==2)) ? 
        score_choice(dice)  :  0;        
}

int score_four_of_a_kind(list<int> dice){
     dice.sort();
     int a = count_my_number(dice, dice.front());
     int b = count_my_number(dice, dice.back());
     int sc = 0;
     if(a>=4)
         sc = 4*dice.front();
     else if(b>=4)
         sc = 4*dice.back();
     return sc;
}


int score(std::list<int> dice, std::string cat){ 
    map<string,int> categories = 
        {{"ones", 0}, {"twos", 1}, {"threes", 2}, 
        {"fours", 3},{"fives", 4}, {"sixes", 5}, 
        {"full house", 6}, {"four of a kind", 7},
        {"little straight", 8}, {"big straight", 9}, 
        {"choice", 10}, {"yacht", 11}};
    
    int res = 0;
    auto search = categories.find(cat);
    if (search != categories.end()) {
        switch(search->second) {
            case(0):
            case(1):
            case(2):
            case(3):
            case(4):
            case(5): 
                res = score_by_number(dice, search->second+1);
                break;
            case(6):
                res = score_full_house(dice);
                break;
            case(7): 
                res = score_four_of_a_kind(dice);
                break;
            case(8): 
                res = score_lt_straight(dice);
                break;
            case(9): 
                res = score_big_straight(dice);
                break;
            case(10): 
                res = score_choice(dice);
                break;
            default: 
                res = score_yacht(dice);
        }
    }
    else {
        throw std::invalid_argument("Invalid category.");
    }
     return res;
}

}  // namespace yacht
