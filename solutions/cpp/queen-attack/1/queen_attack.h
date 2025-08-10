#if !defined(QUEEN_ATTACK_H)
#define QUEEN_ATTACK_H

#include <utility>

namespace queen_attack {
class chess_board {
    public:
        chess_board(std::pair<int,int> w, std::pair<int,int> b);
        bool can_attack() const;
        auto white() const -> std::pair<int,int> const& {return w_q;} 
        auto black() const -> std::pair<int,int> const& {return b_q;} 
    private:
        bool on_board(std::pair<int,int>);
        std::pair<int,int> w_q;
        std::pair<int,int> b_q;
    };
}  // namespace queen_attack

#endif // QUEEN_ATTACK_H