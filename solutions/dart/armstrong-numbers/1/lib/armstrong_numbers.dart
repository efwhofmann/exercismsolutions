import 'dart:math';

class ArmstrongNumbers {
  bool isArmstrongNumber(String number){
    var sum = BigInt.zero;
    final length = number.length;
    for(var i=0; i<length; i++){
      int di = int.parse(number[i]);
      sum += BigInt.from(di).pow(length);
    } 
    return BigInt.parse(number) == sum;
  }
}
