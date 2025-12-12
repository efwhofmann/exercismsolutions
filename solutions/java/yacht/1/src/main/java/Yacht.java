import java.util.Arrays;


class Yacht {

    int[] my_dice;
    YachtCategory category;

    Yacht(int[] dice, YachtCategory yachtCategory) {
        my_dice = dice;
        category = yachtCategory;
    }

    int count_by_number(int n) {
        int res=0;
        for (int d : my_dice) {
            res += d==n ? 1 : 0;
        }    
        return res;
    }

    int score_by_number() {
        int n = category.ordinal();
        return count_by_number(n)*n;
    }

    int score_yacht() {
        return count_by_number(5)==5 ? 50 : 0;
    }

    int score_choice(){
        int sum = 0;
        for(int d: my_dice){
            sum += d;
        }
        return sum;
    }

    int score_full_house() {
        int[] dcs = my_dice.clone();
        Arrays.sort(dcs);
        int a = count_by_number(dcs[0]);
        int b = count_by_number(dcs[4]);
        return ((a==2 && b==3) || (a==3 && b==2)) ? 
            score_choice()  :  0; 
    }

    int score_four_of_a_kind() {
        int[] dcs = my_dice.clone();
        Arrays.sort(dcs);
        int a = count_by_number(dcs[0]);
        int b = count_by_number(dcs[4]);
        return a>=4 ? 4*dcs[0] : b>=4 ? 4*dcs[4] : 0; 
    }

    int score_straight(int[] strt) {
        int[] dcs = my_dice.clone();
        Arrays.sort(dcs);
        if (Arrays.equals(dcs, strt))
            {return 30; }
        else {return 0;}
    }

    int score_little_straight() {
        int[] ltl_s= {1,2,3,4,5};
        return score_straight(ltl_s);
    }

    int score_big_straight() {
        int[] bg_s= {2,3,4,5,6};
        return score_straight(bg_s);
    }

    int score() {
        int res=0;
        switch(category){
            case ONES: 
            case TWOS: 
            case THREES:
            case FOURS:
            case FIVES:
            case SIXES: 
                res = score_by_number();
                break;
            case FULL_HOUSE: 
                res=score_full_house();
                break;
            case FOUR_OF_A_KIND:  
                res = score_four_of_a_kind();
                break;
            case LITTLE_STRAIGHT:
                res = score_little_straight();
                break;
            case BIG_STRAIGHT: 
                res = score_big_straight();
                break;
            case CHOICE: res=score_choice();
                break;
            case YACHT: res=score_yacht();
                break;
        }
        return res;
    }

}
