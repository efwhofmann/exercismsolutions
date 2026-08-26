import 'package:collection/collection.dart';

class Luhn {
  bool valid(String candidate){
    var cand = candidate.replaceAll(' ','');
    var nonDigits = new RegExp(r'[^0-9]');
    if(!nonDigits.allMatches(cand).isEmpty)
      return false;
    if(cand.length<=1)
      return false;
    var checksum = cand.split('')
      .map((d)=>int.parse(d))
      .mapIndexed((idx,d) 
                   => (d!=9 && (cand.length - idx) % 2 == 0)
                        ?  (2*d)% 9 : d)
      .toList()
      .reduce((a,b) => a + b);
    return checksum % 10 == 0;
  }
}
