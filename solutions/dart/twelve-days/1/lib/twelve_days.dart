class TwelveDays {
   static List<String> dayNumbers =  ["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"];
  
  static List<String> gifts = ["a Partridge in a Pear Tree",
"two Turtle Doves", "three French Hens", 
"four Calling Birds", "five Gold Rings", "six Geese-a-Laying", 
"seven Swans-a-Swimming", "eight Maids-a-Milking", 
"nine Ladies Dancing", "ten Lords-a-Leaping",
"eleven Pipers Piping", "twelve Drummers Drumming"];

  String day(int number){
        String allGifts = '';
        String firstLine = 'On the ' + dayNumbers[number-1] + ' day of Christmas my true love gave to me: ';
        if(number==1) 
            allGifts+= gifts[0];
        else {        
            for(int idx = 1; idx<=number-1; idx++) {
                allGifts = gifts[idx] + ', ' + allGifts; 
            }
            allGifts += 'and ' + gifts[0];
        }
        return firstLine + allGifts  + '.'; 
  }

  String recite(int from, int to) {
        String output = '';
        bool several = (from!=to);
        for(int i=from; i<=to; i++)
            output+= day(i) 
                + (several && i!=to? '\n' : '');
        return output;
    }
  
}
