#include "queen_attack.h"
#include <stdlib.h>

attack_status_t can_attack(position_t queen_1, position_t queen_2){
    if (queen_1.row>7 || queen_1.column>7 || queen_2.row>7 || queen_2.column>7)
        return INVALID_POSITION;
    else if(queen_2.row == queen_1.row && queen_1.column == queen_2.column)
        return INVALID_POSITION;
    else if (queen_1.row == queen_2.row || queen_1.column == queen_2.column)
        return CAN_ATTACK;
    int dx = abs(queen_1.row - queen_2.row);
    int dy = abs(queen_1.column - queen_2.column);
    return  ((dx == dy) ? CAN_ATTACK : CAN_NOT_ATTACK);     
    
}

