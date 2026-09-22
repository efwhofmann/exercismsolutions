class Proverb {
  String recite(List<String> pieces){
    String res = "";
    if(pieces.isEmpty)
      return res;
    for(var i=0; i<pieces.length-1; i++){
      res += "For want of a ${pieces[i]} the ${pieces[i+1]} was lost.\n";
    }
    res += "And all for the want of a ${pieces[0]}.";
    return res;
  }
}
