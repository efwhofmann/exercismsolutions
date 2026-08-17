class ResistorColorDuo {
  final List<String> _colors = ['black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white'];

  int value(List<String> code){
    return 10*_colors.indexOf(code[0]) 
      + _colors.indexOf(code[1]);
  }
}
