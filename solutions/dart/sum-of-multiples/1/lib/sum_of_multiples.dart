class SumOfMultiples {
  int sum(List<int> factors, int limit){
    var sm = 0;
    var mults = <int>{};
    for(var f in factors){
      for(var m=f; m<limit && m!=0; m+=f){
        if(!mults.contains(m)){
          sm += m;
          mults.add(m);
        }
      }
    }
    return sm;
  }
}
