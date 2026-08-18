import 'dart:math';

class PrimeFactors {
  List<int> factors(int num){
    List<int> theFactors = [];
    for(var k=2; k<= sqrt(num); k++){
      while(num % k == 0){
        theFactors.add(k);
        num ~/= k;
      }
    }
    if(num>1)
      theFactors.add(num);
    return theFactors;
  }
}
