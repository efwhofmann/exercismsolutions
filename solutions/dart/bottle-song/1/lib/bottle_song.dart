class BottleSong {
  static List<String> numbers = ["ten", "nine", "eight", "seven", "six", "five", "four", "three", "two", "one", "no"];

  static  String occurence = 'And if one green bottle should accidentally fall,';


  String capitalize(String word){
    return word[0].toUpperCase() + word.substring(1);
  }

  List<String> recite(int start, int take){
    var song = <String>[];
    var first = 10-start;
    var last = 10 - start + take;
    for(var idx=first; idx<last; idx++){
      String currentBtls = 'bottle';
      currentBtls += (idx!=9) ? 's' : '';
      String nextBtls = 'bottle';
      nextBtls += (idx!=8) ? 's' : '';
      String number1 = capitalize(numbers[idx]);
      String number2 = numbers[idx+1];
      String firstLine = '${number1} green ${currentBtls} hanging on the wall,';
      song.addAll([firstLine, firstLine]);
      song.add(occurence);
      song.add("There'll be ${number2} green ${nextBtls} hanging on the wall.");        
      if(take!=1 && idx!=9-start+take)
        song.add('');  
    }
    return song;
  }  
}
