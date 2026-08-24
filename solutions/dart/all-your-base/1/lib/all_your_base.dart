class AllYourBase {
  List<int> rebase(int basein, List<int> digitsin, int baseout){
    int value=0;
    int power = 1;
    if(basein<2 || baseout<2 || digitsin.any((d)=>d>=basein || d<0)){throw ArgumentError('invalid input');}
    for(var d in digitsin.reversed.toList()){
      value+=d * power;
      power *= basein;
    }
    List<int> dout = [];
    if(value==0)
      return [0];
    while(value>0){
      dout.add(value % baseout);
      value ~/= baseout;
    }
    return dout.reversed.toList();
  }
}
