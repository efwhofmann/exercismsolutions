import 'package:collection/collection.dart';

class Sieve {
  
  final int limit;
  
  Sieve(this.limit);

  List<int> get primes {
    if(limit<2)
      return <int>[];
    var marks =  List<bool>
      .generate(limit, (idx) => idx%2==0,
                growable : false); 
    // idx-1 is the corresponding number
    marks[1] = true; // 2
    int n = 3;
    while(n<=limit){
      if(marks[n-1]){
      for(int k=n*n; k<=limit; k+=n){
        marks[k-1] = false;
      }}
      n++;      
    }    
    //transform marks to numbers,
    // remove non-primes and 1
    return marks 
      .mapIndexed( (idx, mark) 
                  => mark? idx+1 : 0) 
      .where((x) =>x>1).toList();
  }
}
