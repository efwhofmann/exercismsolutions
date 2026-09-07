import 'package:yacht/categories.dart';
import 'package:collection/collection.dart';

class Yacht {
  List<int> dice;

  Yacht(this.dice);

  int count(List<int> ds, int n)=>
    ds.where((d)=>d==n).length;

  int score(Category cat){
    int res = 0;
    switch(cat){
      case Category.ones : res = count(dice, 1);
      case Category.twos : res = 2*count(dice, 2);
      case Category.threes : res = 3*count(dice, 3);
      case Category.fours : res = 4*count(dice, 4);
      case Category.fives : res = 5*count(dice, 5);
      case Category.sixes : res = 6*count(dice, 6);
      case Category.full_house: 
        dice.sort();
        int a = count(dice,dice[0]);
        int b = count(dice,dice[4]);
        res = ((a==2 && b==3) || (a==3 && b==2)) ? 
          dice.reduce((v,e)=>v+e) : 0;
      case Category.four_of_a_kind:
        dice.sort();
        if(dice[0]==dice[3] || dice[1] == dice[4])
          res = 4*dice[1];
      case Category.little_straight:
        dice.sort();
        if(ListEquality().equals(dice,[1,2,3,4,5]))
          res = 30;
      case Category.big_straight:
        dice.sort();
        if(ListEquality().equals(dice,[2,3,4,5,6]))
          res = 30;
      case Category.choice:
        res = dice.reduce((v,e)=>v+e);
      case Category.yacht:
        res = (dice.toSet().length == 1) ? 50 : 0;    
    }
    return res;
  }
  
}
