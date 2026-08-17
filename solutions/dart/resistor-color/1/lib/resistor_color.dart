class ResistorColor {

  final List<String> _colors = ['black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white'];
  
  
  List<String> get colors => _colors;


  int colorCode(String color) => _colors.indexOf(color);
  
}
