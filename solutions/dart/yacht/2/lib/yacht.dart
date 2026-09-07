import 'package:yacht/categories.dart';
import 'package:collection/collection.dart';

class Yacht {
  List<int> dice;

  Yacht(this.dice){
    dice.sort();
  }

  int count(List<int> ds, int n)=>
    ds.where((d)=>d==n).length;

  int score_fullHouse() {
    int a = count(dice,dice[0]);
    int b = count(dice,dice[4]);
    return ((a==2 && b==3) || (a==3 && b==2)) ? 
      dice.reduce((v,e)=>v+e) : 0; 
  }

  int score_fourOf() {
      if(dice[0]==dice[3] || dice[1] == dice[4])
         return 4*dice[1];
     else return 0;    
  }

   int score_ltlStraight(){
      if(ListEquality().equals(dice,[1,2,3,4,5]))
          return 30;
       else return 0;
   }

   int score_bgStraight(){
      if(ListEquality().equals(dice,[2,3,4,5,6]))
          return 30;
       else return 0;
   }

 int score_yacht(){
    return (dice.toSet().length == 1) ? 50 : 0;} 
  
  int score(Category cat)=>    
    switch(cat){
      Category.ones  => count(dice, 1),
      Category.twos => 2*count(dice, 2),
      Category.threes => 3*count(dice, 3),
      Category.fours => 4*count(dice, 4),
      Category.fives => 5*count(dice, 5),
      Category.sixes => 6*count(dice, 6),
      Category.full_house => score_fullHouse(),
      Category.four_of_a_kind => score_fourOf(),
      Category.little_straight => score_ltlStraight(),
      Category.big_straight => score_bgStraight(),
      Category.choice => dice.reduce((v,e)=>v+e),
      Category.yacht => score_yacht(),
      _ => 0,
    };
  
  
}
