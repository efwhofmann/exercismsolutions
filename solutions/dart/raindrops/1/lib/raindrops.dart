class Raindrops {
  String convert(int num){
    String sound = ( num % 3==0 ? 'Pling' : '') + 
      ( num % 5==0 ? 'Plang' : '') +
      ( num % 7==0 ? 'Plong' : '');
    if(sound=='')
      sound =  num.toString();
    return sound;
  }
}
