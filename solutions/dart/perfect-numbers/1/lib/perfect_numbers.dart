enum Classification { deficient, abundant, perfect}

class PerfectNumbers {
  
  Classification classify(int num){
    if(num<1){
      throw ArgumentError('Not a positive integer');
    } 
    if(num==1)
      return Classification.deficient;
    int aSum = 1;
    for(var k=2; k< num; k++){
      if(num % k == 0)
        aSum += k;
    }
    if(aSum > num)
      return Classification.abundant;
    else if (aSum == num)
      return Classification.perfect;
    else
      return Classification.deficient;
  }
}
