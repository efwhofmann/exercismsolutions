#include "queen_attack.h"
#include <utility>
#include <cmath>
#include <stdexcept>

namespace queen_attack {

   bool chess_board::on_board(std::pair<int,int> queen){
      return (  (queen.first>=0) && (queen.first<8) &&
            (queen.second>=0) && (queen.second<8) );
   }

    chess_board::chess_board(std::pair<int,int> w, std::pair<int,int> b): w_q{w}, b_q{b}{
        if  (w == b)
            throw std::domain_error("Queen positions must be distinct.");  
        else if (!on_board(w) || !on_board(b))
            throw std::domain_error("Position not on board."); 
    }

    bool chess_board::can_attack() const {
        int dx = abs(w_q.first - b_q.first);
        int dy = abs(w_q.second - b_q.second);
        return ((!dx) || (!dy) || (dx == dy));
    }
    

}  // namespace queen_attack
