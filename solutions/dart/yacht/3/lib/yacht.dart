import 'package:yacht/categories.dart';
import 'package:collection/collection.dart';

class Yacht {
  List<int> dice;

  Yacht(this.dice){
    dice.sort();
  }

  int count(int n)=>
    dice.where((d)=>d==n).length;

  int score_fullHouse() {
    if ((dice.toSet().length == 2) &&
      (dice[1] != dice[2] || dice[2]!=dice[3])){
        return dice.reduce((v,e)=>v+e);
      }
    else return 0;
    }

  int score_fourOf() {
      if(dice[0]==dice[3] || dice[1] == dice[4])
         return 4*dice[1];
     else return 0;    
  }

   int score_Straight(List<int> straight){
      if(ListEquality().equals(dice, straight))
          return 30;
       else return 0;
   }


 int score_yacht(){
    return (dice.toSet().length == 1) ? 50 : 0;} 
  
  int score(Category cat)=>    
    switch(cat){
      Category.ones  => count(1),
      Category.twos => 2*count(2),
      Category.threes => 3*count(3),
      Category.fours => 4*count(4),
      Category.fives => 5*count(5),
      Category.sixes => 6*count(6),
      Category.full_house => score_fullHouse(),
      Category.four_of_a_kind => score_fourOf(),
      Category.little_straight => score_Straight([1,2,3,4,5]),
      Category.big_straight => score_Straight([2,3,4,5,6]),
      Category.choice => dice.reduce((v,e)=>v+e),
      Category.yacht => score_yacht(),
      _ => 0,
    };
  
  
}
