class NthPrime {
  
  int prime(int N){
    if(N<1)
      throw ArgumentError("There is no zeroth prime");
    if(N<3)
      return N==1 ? 2 : 3; 
    
    var primes = [2,3];
    int count = 2;
    for(var cand=5; count<=N; cand += 2){
      var isPrime = true;
      for(var p in primes){
        if(0==cand % p){
          isPrime = false;
          break;
        }        
      }
      if(isPrime){
        primes.add(cand);
        count ++;
      }
    }
    return primes[N-1];
  }
  
}
