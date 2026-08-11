class AtbashCipher {

  String? _codeOne(String s){
    var code = s.codeUnitAt(0);
    final int aa = 'a'.codeUnitAt(0);
    final int zz = 'z'.codeUnitAt(0);
    if(code >= aa && code<= zz)
      return String.fromCharCode(zz - code + aa);
    else if(code >= '0'.codeUnitAt(0) && code<='9'.codeUnitAt(0))
      return s;
    else
      return null;
  }
  
  String _cipher(String msg){
    return msg.toLowerCase().split('').map((c) => _codeOne(c) ).nonNulls.join('');
  }

  String decode(String secret){
    return _cipher(secret);
  }

  String encode(String plaintext){
    var secret =  _cipher(plaintext); 
    final groups = <String>[];
    for(var idx = 0; idx<secret.length; idx+=5){
      int end = (idx + 5 > secret.length) ? secret.length : idx + 5;
      groups.add(secret.substring(idx, end));
    }
    return groups.join(' ');
  }
}
