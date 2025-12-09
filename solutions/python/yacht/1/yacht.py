# Score categories.
# Change the values as you see fit.
YACHT = 11
ONES = 0
TWOS = 1
THREES = 2
FOURS = 3
FIVES = 4
SIXES = 5
FULL_HOUSE = 6
FOUR_OF_A_KIND = 7
LITTLE_STRAIGHT = 8
BIG_STRAIGHT = 9
CHOICE = 10

def count_by_number(dice, n):
    return len([d for d in dice if d==n])

def score_by_number(dice, n):
    return n*count_by_number(dice, n)

def score_full_house(dice):
    sd = sorted(dice)
    cnt_one = count_by_number(sd, sd[0])
    cnt_two = count_by_number(sd, sd[-1])
    if (cnt_one==2 and cnt_two==3) or (cnt_one==3 and cnt_two==2):
        return score_choice(dice)
    else:
        return 0

def score_four_of_a_kind(dice):
    sd = sorted(dice)
    no_low = count_by_number(sd, sd[0])
    no_high = count_by_number(sd, sd[-1])
    if no_low>=4:
        return 4*sd[0]
    elif no_high>=4:
        return 4*sd[-1]
    else:
        return 0

def score_choice(dice):
    return sum(dice)    

def score_little_straight(dice):
    if sorted(dice) == [1,2,3,4,5]:
        return 30
    else:
        return 0

def score_big_straight(dice):
    if sorted(dice) == [2,3,4,5,6]:
        return 30
    else:
        return 0

def score_yacht(dice):
    if count_by_number(dice, dice[0])==5:
        return 50
    else:
        return 0



def score(dice, category):
    match category:
        case 0 | 1 | 2 | 3 | 4 | 5:
            return score_by_number(dice, category+1)
        case 6:
            return score_full_house(dice)
        case 7: 
            return score_four_of_a_kind(dice)
        case 8:
            return score_little_straight(dice)
        case 9:
            return score_big_straight(dice)
        case 10:
            return score_choice(dice)
        case 11:
            return score_yacht(dice)
        case _:
            raise ValueError("Unknown scoring option")
            
