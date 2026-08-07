class RnaTranscription {
  final dToRMap = {
    'A' : 'U',
    'T' : 'A',
    'C' : 'G',
    'G' : 'C',
  };
  
  toRna(String dna){
    return dna.split('').map((d) => dToRMap[d]).join();
  }
}
