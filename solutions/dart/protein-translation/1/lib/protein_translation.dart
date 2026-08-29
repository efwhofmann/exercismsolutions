import 'dart:math';

class ProteinTranslation {
  static Map<String,String> codon2amino = {
    'AUG' : 'Methionine',
    'UUU' : 'Phenylalanine',
    'UUC' : 'Phenylalanine',
    'UUA' : 'Leucine',
    'UUG' : 'Leucine',
    'UCU' : 'Serine',
    'UCC' : 'Serine',
    'UCA' : 'Serine',
    'UCG' : 'Serine',
    'UAU' : 'Tyrosine',
    'UAC' : 'Tyrosine',
    'UGU' : 'Cysteine',
    'UGC' : 'Cysteine',
    'UGG' : 'Tryptophan',
    'UAA' : 'STOP',
    'UAG' : 'STOP',
    'UGA' : 'STOP'
  };
  
  List<String> translate(String sequence){
    List<String> polypeptide = [];
    int i=0;
    bool stopped = false;
    for(var i=0; i<=sequence.length-3; i+=3){
      String codon = sequence.substring(i, i+3);
      if(codon2amino.containsKey(codon)){
        String translation = codon2amino[codon]!;
        if(translation == 'STOP'){
          stopped = true;
          break;
        }
        else
          polypeptide.add(translation);
      }
      else 
        throw ArgumentError('invalid codon');  
    }
    if(!stopped && sequence.length%3!=0)
      throw ArgumentError('incomplete sequence');  
    return polypeptide;
  }
}
