import 'package:collection/collection.dart';

class Anagram {

  Map<String,int> letterMapOf(String word){
    var result = Map<String,int>();
    for(var w in word.toLowerCase().split('')){
      result.update(w, (value) => value + 1, 
                    ifAbsent: () => 1); }
    return result;
  }
  
  List<String> findAnagrams(String word, List<String> candidates){  
    List<String> anagrams = [];
    var wordLetters = letterMapOf(word);
    for(var cand in candidates){
      if(cand.length == word.length &&
         cand.toLowerCase()!= word.toLowerCase() &&
          MapEquality().equals(letterMapOf(cand), 
                               wordLetters))
          anagrams.add(cand);        
    }
    return anagrams;
  }
}
