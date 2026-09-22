class FoodChain {
   static final String lineOne = "I know an old lady who swallowed a ";
   static final String wriggle = " that wriggled and jiggled and tickled inside her";
    static final String lastLine = "I don't know why she swallowed the fly. Perhaps she'll die.";

    
    static final List<String> animals = ["fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse"];
 
    static final List<String> phrases = ["",
        "It wriggled and jiggled and tickled inside her.", 
        "How absurd to swallow a bird!",
        "Imagine that, to swallow a cat!",
        "What a hog, to swallow a dog!",
        "Just opened her throat and swallowed a goat!",
        "I don't know how she swallowed a cow!",
        "She's dead, of course!"];

    List<String> verse(int num){
      var res = <String>[];
      res.add(lineOne + animals[num-1] + '.');
      if(num>1) 
        res.add(phrases[num-1]);
      if(num>1 && num<8){
        for(int i=num-1; i>0; i--){
        String line = 'She swallowed the ' + animals[i] 
          + ' to catch the ' + animals[i-1];
          if(2==i)
            line += wriggle;
          line += '.';
          res.add(line);
        }
      }
      if(num<8)
        res.add(lastLine);
      return res;
    }

  List<String> recite(int from, int to){
    List<String> res = <String>[];
    for(var i=from; i<=to; i++){
      res.addAll(verse(i));
      if(i!=to)
        res.add('');
    }
    return res;
  }
  

}
