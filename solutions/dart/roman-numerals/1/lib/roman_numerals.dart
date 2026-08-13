extension ConvertToRomanNumerals on int {
  
  String toRoman() {
    final romantens = ['M','C','X','I'];
    final romanfives = ['D', 'L', 'V'];
    int number = this;
    if(number<1 || number>3999)
      throw ArgumentError('Only numbers between 1 and 3999 are allowed.');
    String result = '';
    int tens = 1000;
    for(var d=0; d<=3; d++){
      int q = number ~/tens;
      number = number % tens;
      if(d==0 || q<4)
        result += romantens[d]*q;
      else if (q==9)
        result += romantens[d] + romantens[d-1];      
      else if (q>=5)
        result += romanfives[d-1] + romantens[d]*(q-5);
      else
        result += romantens[d] + romanfives[d-1];
      tens ~/= 10;
    }
    return result;
  }
}
