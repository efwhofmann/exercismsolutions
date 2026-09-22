class House {

 static  List<String> objects = ["house that Jack built.", "malt", "rat", "cat", "dog", "cow with the crumpled horn", "maiden all forlorn", "man all tattered and torn", "priest all shaven and shorn", "rooster that crowed in the morn", "farmer sowing his corn","horse and the hound and the horn"];

  static List<String> verbs =  ["lay in", "ate", "killed", "worried", "tossed", "milked", "kissed", "married", "woke", "kept", "belonged to"]; 

  static String intro = 'This is ';


  String verse(int num){
      var res = intro + 'the ' + objects[num-1];
      for(var i=num-1; i>0; i--){
        res += ' that ' + verbs[i-1] + ' the ' + objects[i-1];
      }
      return res;    
  }

  String recite(int from, int to){
    List<String> verses = [];
    for(var i=from; i<=to; i++){
      verses.add(verse(i));  
      if(i<to)
        verses.add('\n');
    }
    return verses.join('');
  }
}
