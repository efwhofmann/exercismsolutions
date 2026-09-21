import 'package:collection/collection.dart';

enum Classification {unequal, sublist, superlist, equal}

class Sublist {

  bool isSublist(List<int> short, List<int> long){
    for(var i=0; i<(long.length-short.length)+1; i++){
      if(ListEquality().equals(
        long.getRange(i, i+short.length).toList()
          , short))
        return true;
    } 
    return false;
  }
  
  Classification sublist(List<int> one, List<int> two){
    if(one.length<two.length && isSublist(one,two))
      return Classification.sublist;
    else if(one.length>two.length && isSublist(two,one))
      return Classification.superlist;
    else if(ListEquality().equals(one, two))
      return Classification.equal;
    else
      return Classification.unequal;
  }
}
