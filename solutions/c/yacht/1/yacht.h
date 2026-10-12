#ifndef YACHT_H
#define YACHT_H

#include <stdbool.h>

typedef enum {
   ONES,
   TWOS,
   THREES,
   FOURS,
   FIVES,
   SIXES,
   FULL_HOUSE,
   FOUR_OF_A_KIND,
   LITTLE_STRAIGHT,
   BIG_STRAIGHT,
   CHOICE,
   YACHT
} category_t;

typedef struct {
   int faces[5];
} dice_t;

int score(dice_t dice, category_t category);

int count_number(dice_t dice, int number);
int score_by_number(dice_t dice, int number);
int score_yacht(dice_t dice);
int score_choice(dice_t dice);
bool has_two_to_five(dice_t dice);
int score_lt_straight(dice_t dice);
int score_big_straight(dice_t dice);
int score_four_of_a_kind(dice_t dice);
int score_full_house(dice_t dice);

#endif
