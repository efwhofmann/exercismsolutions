#include "kindergarten_garden.h"

#include <array>
#include <string>

using namespace std;

namespace kindergarten_garden {

    Plants letterToPlant (char lt) {
         switch(lt) {
            case 'R' : return Plants::radishes;
            case 'C' : return Plants::clover;
            case 'G' : return Plants::grass;
            default: return Plants::violets;        
        }
    } 
  
    array<Plants,4> plants(string garden, string student){
        int studentNo = student.at(0) - 'A';
        int offset = garden.length()/2 + 1 + 2*studentNo;
        array<Plants,4> result =         
            {letterToPlant(garden.at(2*studentNo)),
            letterToPlant(garden.at(2*studentNo + 1)), 
            letterToPlant(garden.at(offset)),
            letterToPlant(garden.at(offset +1))};
        return result;
    }
    
}  // namespace kindergarten_garden
