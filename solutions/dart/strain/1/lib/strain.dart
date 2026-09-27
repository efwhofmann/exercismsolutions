class Strain {
  List<T> keep<T> (List<T> values, bool Function(T) predicate){
    var result = <T>[];
    for(var v in values){
      if(predicate(v))
        result.add(v);
    }
    return result;
  }

  List<T> discard<T> (List<T> values, bool Function(T) predicate){
    var result = <T>[];
    for(var v in values){
      if(!predicate(v))
        result.add(v);
    }
    return result;
  }
}
