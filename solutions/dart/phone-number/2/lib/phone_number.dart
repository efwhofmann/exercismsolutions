class PhoneNumber {

  String validDigits(String raw){
    var lts = RegExp(r"[a-zA-Z]");
    if(lts.hasMatch(raw))
      throw FormatException('letters not permitted');
    var punct = RegExp(r"[@:;!?*]");
    if(punct.hasMatch(raw))
      throw FormatException('punctuations not permitted');
    var dgts = RegExp(r"[0-9]");
    return dgts.allMatches(raw).map((m)=> m[0]).join(); 
  }
  
  String clean(String raw){
    var num = validDigits(raw);
    if(num.length>11)
      throw FormatException('must not be greater than 11 digits');
    if(num.length<10)
      throw FormatException('must not be fewer than 10 digits');
    if(num.length==11){
      if(num.substring(0,1) !='1')
        throw FormatException('11 digits must start with 1');
      num = num.substring(1);
    }
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
}
