// Implement a custom InvalidNucleotideException exception
class InvalidNucleotideException implements Exception {}


class NucleotideCount {  

  Map<String,int> count(String strand){
    var nucCount = {
    'A' : 0,
    'C' : 0,
    'G' : 0,
    'T' : 0,
    };
    var nucs = strand.split(''); 
    for(var n in nucs){
      if(nucCount.containsKey(n)){
        int newVal = nucCount[n]! + 1;
        nucCount[n] = newVal;
      } else {
        throw  InvalidNucleotideException();
      }
    }
    return nucCount;
  }
  
}
