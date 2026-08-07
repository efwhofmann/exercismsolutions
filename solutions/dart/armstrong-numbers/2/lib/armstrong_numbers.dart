import 'dart:math';

class ArmstrongNumbers {
  bool isArmstrongNumber(String number){
    final length = number.length;
    var sum = number.codeUnits.fold(BigInt.zero, (s,d) =>
                         s + BigInt.from(d-48).pow(length));
    return BigInt.parse(number) == sum;
  }
}
