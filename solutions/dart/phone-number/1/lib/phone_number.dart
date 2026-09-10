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
   // bool elevenDigits = false;
    if(num.length>11)
      throw FormatException('must not be greater than 11 digits');
    if(num.length<10)
      throw FormatException('must not be fewer than 10 digits');
    if(num.length==11){
      if(num.substring(0,1) !='1')
        throw FormatException('11 digits must start with 1');
     // elevenDigits = true;
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
    /*
    var num = raw.codeUnits
      .where((c)=>c>='0'.codeUnitAt(0) && c<='9'.codeUnitAt(0))
      .map((c)=>String.fromCharCodes([c])).toList();
      if(![10,11,12].contains(num.length)){
        String msg='';
        if(num.length>11)
            msg = 'must not be greater than 11 digits';
        else if(num.length<10)
           msg = 'must not be fewer than 10 digits';
        throw FormatException(msg);
      }
        
      if(num.length==11){
        if(num[0]!='1') 
          throw FormatException('11 digits must start with 1');
        num.removeAt(0);
      }
      List<String> twoToNine = List.generate(8,(i) =>                        String.fromCharCode('2'.charCodeAt(0) + i));
     if(!twoToNine.contains(num[0]) 
        || !twoToNine.contains(num[3]))
         throw FormatException('');
     return num.join();*/
  }
}
