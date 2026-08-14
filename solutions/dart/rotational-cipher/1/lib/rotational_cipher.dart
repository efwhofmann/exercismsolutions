class RotationalCipher {
  static const int aa = 65; // 'a'
  static const int zz = 90; // 'z'
  static const int AA = 97; // 'A'
  static const int ZZ = 122; // 'Z'
  
  String rotate({required String text, required int shiftKey}){
    return text.split('')
            .map((c) => _encodeChar(c, shiftKey)).join();  
  }

  String _encodeChar(String ch, int key){
    int cc = ch.codeUnitAt(0);
    int newCC;
    if(cc>=aa && cc<=zz){
      newCC = (cc-aa+key) % 26 + aa;
    } else if (cc>=AA && cc<=ZZ){
      newCC = (cc-AA+key) % 26 + AA;
    }
    else
      newCC = cc;
    return String.fromCharCodes([newCC]);
  }
}
