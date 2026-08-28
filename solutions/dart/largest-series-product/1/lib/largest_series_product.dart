import 'dart:math';

class LargestSeriesProduct {

 

  int largestProduct(String digitString,  int span){
    if (span<0)
      throw ArgumentError('span must not be negative');
    else if (span>digitString.length)
      throw ArgumentError('span must be smaller than string length'); 
    else if (span==0)
      return 1;
    
    List<int> digits =
     RegExp(r"\d")
       .allMatches(digitString)
       .map((m)=>m.group(0))
       .nonNulls
       .map((d) => int.tryParse(d))
       .nonNulls.toList();
    if(digits.length != digitString.length)
      throw ArgumentError('digits input must only contain digits');

    int largest=0;
    for(var i=0; i<digits.length - span+1; i++){
      int product = digits.sublist(i,i+span)
        .reduce((a,b)=>a*b);
      if(product>largest) 
        largest = product;
    }
    return largest;
  }
  
}
