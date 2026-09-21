import 'package:collection/collection.dart';

class HighScores {
  late List<int> _scores;

  HighScores(List<int> scs){
    _scores = List.from(scs);
  }

  get scores {
    return _scores;
  }

  int latest(){
    return _scores.last;
  }

  int personalBest(){
    return _scores.fold(_scores[0], (cur, next) => cur<next ? next : cur);
  }

  List<int> personalTopThree(){
    var sorted = [..._scores]..sort();
    sorted = sorted.reversed.toList(); 
    if(sorted.length<3)
      return sorted;
    return  sorted.slice(0,3);
  }
  
}
