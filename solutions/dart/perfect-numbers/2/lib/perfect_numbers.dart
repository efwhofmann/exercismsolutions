enum Classification { deficient, abundant, perfect}

class PerfectNumbers {

  int aliquotSum(int n){
    int sum = 1;
    for(var k=2; k< n; k++){
      if(n % k == 0)
        sum += k;
    }
    return sum;
  }
  
  Classification classify(int number){
    if(number<1){
      throw ArgumentError('Not a positive integer');
    } 
    if(number==1)
      return Classification.deficient;
    int aSum = aliquotSum(number);
    if(aSum > number)
      return Classification.abundant;
    else if (aSum == number)
      return Classification.perfect;
    else
      return Classification.deficient;
  }
}
