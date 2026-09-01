class Acronym {
  String abbreviate(String phrase){
    return phrase
          .replaceAll('_',' ')
          .replaceAllMapped(RegExp(r'(\b\w)(\B\w+)'),
          (Match m) => (m[0]!)[0].toUpperCase())
          .replaceAll(RegExp(r'[^A-Z]'),''); 
  }
  
}
