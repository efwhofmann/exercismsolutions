import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* Third version using regular expressions 
    inspired from ingquimbay's solution */

class SqueakyClean {
    static String clean(String input) {
        String step1 = input.replaceAll("\\s", "_");

    // Kebab- to Camel-case using regex patterns
        Matcher matcher = Pattern.compile("-(\\w)").matcher(step1);        
        StringBuffer sb = new StringBuffer();
        while(matcher.find()){
            matcher
                .appendReplacement(sb,
                    matcher.group(1).toUpperCase());
        }
        matcher.appendTail(sb);
        String step2 = sb.toString();

    // Leet-speak
       String step3 = step2.replaceAll("0","o")
                            .replaceAll("1", "l")
                            .replaceAll("3","e")
                            .replaceAll("4","a")
                            .replaceAll("7","t");
        
        return step3.replaceAll("[^a-zA-Z_]", "");
    }
} 