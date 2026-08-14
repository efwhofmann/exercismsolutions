class RotationalCipher {
  static const int aa = 65; // 'a'
  static const int zz = 90; // 'z'
  static const int AA = 97; // 'A'
  static const int ZZ = 122; // 'Z'
  
  String rotate({required String text, required int shiftKey}){
    return String.fromCharCodes(
              text.runes
              .map((r) => switch(r) {
                 >=aa && <=zz => (r-aa+shiftKey) % 26 + aa,
                 >=AA && <=ZZ => (r-AA+shiftKey) % 26 + AA,
                 _ => r,
              }));  
  }


}
