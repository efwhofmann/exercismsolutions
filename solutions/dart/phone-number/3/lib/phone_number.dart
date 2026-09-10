class PhoneNumber {

  String validateDigits(String raw){
    var lts = RegExp(r"[a-zA-Z]");
    if(lts.hasMatch(raw))
      throw FormatException('letters not permitted');
    var punct = RegExp(r"[@:;!?*]");
    if(punct.hasMatch(raw))
      throw FormatException('punctuations not permitted');
    var dgts = RegExp(r"[0-9]");
    return dgts.allMatches(raw).map((m)=> m[0]).join(); 
  }

  String validateLength(String str){
     if(str.length>11)
      throw FormatException('must not be greater than 11 digits');
    if(str.length<10)
      throw FormatException('must not be fewer than 10 digits');
    if(str.length==11){
      if(str.substring(0,1) !='1')
        throw FormatException('11 digits must start with 1');
      str = str.substring(1);
    }
    return str;
  }

  validateCodes(String num){
    List<int> digits = num.split('')
                        .map((d) => int.parse(d))
                        .toList();
    if(digits[0]<2){
      String d = digits[0]==0 ? 'zero' : 'one';
      throw FormatException("area code cannot start with ${d}");
    }
    if(digits[3]<2){
      String d = digits[3]==0 ? 'zero' : 'one';
      throw FormatException("exchange code cannot start with ${d}");
    }
    return num;
  }
  
  String clean(String raw){
    return validateCodes(validateLength(
      validateDigits(raw)));
  }
}
