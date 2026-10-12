#include "yacht.h"
#include <stdbool.h>

int count_number(dice_t dice, int number){
    int sum = 0;
    for(int i=0; i<5; i++)
        if(dice.faces[i] == number)
            sum++;
    return sum;
}

int score_by_number(dice_t dice, int number){
    return number*count_number(dice, number);
}

int score_yacht(dice_t dice){
    return count_number(dice, dice.faces[0]) == 5 ? 50 : 0;
}

int score_choice(dice_t dice){
    int sum = 0;
    for(int i=0; i<5; i++)
        sum += dice.faces[i];
    return sum;
}

bool has_two_to_five(dice_t dice){
    bool res = true;
    for(int i=2; i<6; ++i){
        res = res && (count_number(dice, i)>=1);
    }
    return res;
}

int score_lt_straight(dice_t dice){
    if((count_number(dice, 1)==1) && has_two_to_five(dice))
        return 30;
    else return 0;
}

int score_big_straight(dice_t dice){
    if((count_number(dice, 6)==1) && has_two_to_five(dice))
        return 30;
    else return 0;
}

int score_four_of_a_kind(dice_t dice){
    for(int i=1; i<=6; i++){
        if(count_number(dice,i)>=4)
            return 4*i;
    }
    return 0;
}

int score_full_house(dice_t dice){
    bool has_double = false;
    bool has_triple = false;
    int sum = 0;
    for(int i=1; i<=6; i++){
        int ct = count_number(dice,i);
        if(ct==2){
         if(!has_double){
            has_double = true;
            sum += 2*i;
         } else return 0;
        }
        else if (ct==3){
            has_triple = true;
            sum += 3*i;
        }            
    }
    if(has_double && has_triple)
        return sum;
    else return 0;
}

int score(dice_t dice, category_t category){
    int score = 0;
    switch(category){
       case(ONES): score = score_by_number(dice, 1);
                        break;            
       case(TWOS): score = score_by_number(dice, 2);
                        break;
       case(THREES): score = score_by_number(dice, 3);
                        break;
       case(FOURS): score = score_by_number(dice, 4);
                        break;
       case(FIVES): score = score_by_number(dice, 5);
                        break;
       case(SIXES): score = score_by_number(dice, 6);
                        break;
       case(FULL_HOUSE): score = score_full_house(dice);     
                        break;
       case(FOUR_OF_A_KIND): 
            score = score_four_of_a_kind(dice);
                        break;
        case(LITTLE_STRAIGHT):
            score = score_lt_straight(dice);
                        break;
       case(BIG_STRAIGHT): 
            score = score_big_straight(dice);
                        break;
       case(CHOICE): 
            score = score_choice(dice); break;
       case(YACHT): score = score_yacht(dice); break;
    }
    return score;
}


