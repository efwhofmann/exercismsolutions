#include "secret_handshake.h"
#include <vector>
#include <array>
#include <string>
#include <cstddef>
#include <bitset>

using namespace std;

namespace secret_handshake {

vector<string> commands(int code){
    bitset<5> cmds_b(code);
    array<string, 4> words{"wink", "double blink", 
        "close your eyes", "jump"};
    vector<string> actions;
    for(size_t i=0; i<cmds_b.size()-1; ++i){
        if (cmds_b.test(i))
            actions.push_back(words.at(i));
    }
    if (cmds_b.test(4)) {
        vector<string> tmp;
        for(size_t i=actions.size(); i--;){
            tmp.emplace_back(actions.at(i));
        }
        actions = tmp;
    }
    return actions;
}
}  // namespace secret_handshake
