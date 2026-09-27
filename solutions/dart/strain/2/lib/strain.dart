class Strain {
  List<T> keep<T> (List<T> values, bool Function(T) predicate){
    final result = <T>[];
    for(final v in values){
      if(predicate(v))
        result.add(v);
    }
    return result;
  }

  List<T> discard<T> (List<T> values, bool Function(T) predicate){
    final result = <T>[];
    for(final v in values){
      if(!predicate(v))
        result.add(v);
    }
    return result;
  }
}
