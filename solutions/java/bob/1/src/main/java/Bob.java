import java.util.regex.Matcher;
import java.util.regex.Pattern;

class Bob {

    String[] responses = {
        "Sure.",
        "Whoa, chill out!",
        "Calm down, I know what I'm doing!",
        "Fine. Be that way!",
        "Whatever."};

    boolean isShouting(String input) {
        Pattern capitals = Pattern.compile("\\p{Lu}");
        Pattern nonCaps =  Pattern.compile("\\p{Ll}");
        return (capitals.matcher(input).find() && 
            ! nonCaps.matcher(input).find());
    }

    boolean isSilence(String input){
        return !Pattern.compile("\\S").matcher(input).find();
    }

    String hey(String input) {
        String response="";
        input = input.trim();
        if (isSilence(input))
            response = responses[3];
        else if (input.charAt(input.length() -1)=='?') 
            response = isShouting(input) ? responses[2] : responses[0];
        else if (isShouting(input))
            response = responses[1];
        else 
            response = responses[4];
        return response;
    }

}