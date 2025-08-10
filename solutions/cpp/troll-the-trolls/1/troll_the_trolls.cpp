namespace hellmath {

enum class AccountStatus {
    troll, guest, user, mod
};

enum class Action {
    read, write, remove
};


bool display_post(AccountStatus poster, AccountStatus viewer){
    if (poster == AccountStatus::troll && viewer !=AccountStatus::troll )
        return false;
    else 
        return true;
}

bool permission_check(Action action, AccountStatus agent){
    switch (action) {
       case Action::read:
            return true;
       case Action::write:
            return (agent != AccountStatus::guest);
       case Action::remove:
            return (agent == AccountStatus::mod);
        default:
            return false;
    }
}

bool valid_player_combination(AccountStatus player1, AccountStatus player2) {
    if(player1 == AccountStatus::guest || player2 == AccountStatus::guest) 
        return false;
    else if (player1 == AccountStatus::troll 
        || player2 == AccountStatus::troll)
        return (player1 == player2);
    else
        return true;
} 

bool has_priority(AccountStatus player1, AccountStatus player2) {
    return (player1 > player2);
}



}  // namespace hellmath