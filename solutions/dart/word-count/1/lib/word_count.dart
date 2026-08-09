class WordCount {
  Map<String, int> countWords(String text){
    var result = Map<String,int>();
    var wordList = 
     RegExp(r"\b[\w']+\b").allMatches(text.toLowerCase())
      .map((m) => m.group(0)).nonNulls;
    for(var w in wordList){
      if(result.containsKey(w)){
        result[w] = result[w]!+1;
      }
      else
        result[w] = 1;
    }
    return result;
  }
}
