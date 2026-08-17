class ResistorColorTrio {
  final List<String> _colors = ['black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white'];

  String label(List<String> code){
    String unit = "ohms";
    int digit1 = _colors.indexOf(code[0]);
    int digit2 = _colors.indexOf(code[1]);
    int val = (0 == digit2) ? digit1 : 10*digit1 + digit2;
    int zeros = _colors.indexOf(code[2]);
    if (digit2==0)
      zeros++;
    switch(zeros % 3){
        case 1 : val *= 10;
        case 2 : val *= 100;
        default : break;
    }
    switch(zeros ~/ 3){
        case 1: unit = "kilo" + unit;
        case 2: unit = "mega" + unit;
        case 3: unit = "giga" + unit;
      default : break;
    }
    return val.toString() + " " + unit;
  }
}
