bool isValid(String isbn){
  if(isbn=='')
    return false;
  var clean = RegExp(r"\d[-\d]+[0-9X]$").allMatches(isbn)
        .map((m)=>m.group(0)).nonNulls.join();
  if(clean.length != isbn.length)
      return false;
  var digits = clean.replaceAll('-','').split('').toList();
  var sum = digits.asMap().map((i,d) => 
                       MapEntry(i,(int.tryParse(d) ?? 
                                   10) * (10-i)))
                  .values.reduce((a,b)=>a+b);
  return sum%11==0 && digits.length == 10;
}