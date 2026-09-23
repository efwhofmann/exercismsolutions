import 'dart:math';

class DndCharacter {
  late int strength;
  late int dexterity;
  late int constitution;
  late int intelligence;
  late int wisdom;
  late int charisma;
  late int hitpoints;
  
  static int modifier(int score) {
        int x = score-10;
        if (x<0) x--;
        return x~/2;    
   }

  static int ability(){
    Random rand = new Random();
    int sum = 0;
    int mi = 6;
    for(int i=0; i<4; i++){
      int r = rand.nextInt(6)+1;
      sum += r;
      mi = min(mi,r);
    }
    return sum-mi;
  }

  DndCharacter.create(){
    strength = ability();
    dexterity = ability();
    constitution = ability();
    intelligence = ability();
    wisdom = ability();
    charisma = ability();
    hitpoints = 10 + modifier(constitution);
  }
}
