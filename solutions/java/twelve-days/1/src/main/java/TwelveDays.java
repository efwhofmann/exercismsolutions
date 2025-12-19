class TwelveDays {

    final String[] day_numbers =  {"first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"};
    final String[] gifts = {"a Partridge in a Pear Tree",
"two Turtle Doves", "three French Hens", 
"four Calling Birds", "five Gold Rings", "six Geese-a-Laying", 
"seven Swans-a-Swimming", "eight Maids-a-Milking", 
"nine Ladies Dancing", "ten Lords-a-Leaping",
"eleven Pipers Piping", "twelve Drummers Drumming"};


    String verse(int number) {
        String all_gifts = "";
        String first_line = "On the " + day_numbers[number-1] + " day of Christmas my true love gave to me: ";
        if(number==1) 
            all_gifts+= gifts[0];
        else {        
            for(int idx = 1; idx<=number-1; idx++) {
                all_gifts = gifts[idx] + ", " + all_gifts; 
            }
            all_gifts += "and " + gifts[0];
        }
        return first_line + all_gifts + ".\n";
    }

    String verses(int from, int to) {
        String output = "";
        Boolean several = (from!=to);
        for(int i=from; i<=to; i++)
            output+= verse(i) + (several && i!=to? "\n" : "");
        return output;
    }
    
    String sing() {
        return verses(1,12);
    }
}
