import java.util.regex.*;

class RunLengthEncoding {

    String encode(String data) {
        Pattern pattern=Pattern.compile("(.)\\1+"); 
            //Note: NOT Pattern.CASE_INSENSITIVE
        Matcher matcher=pattern.matcher(data);
        return matcher.replaceAll(matchResult ->  matchResult.group().length() + matchResult.group(1));
    }

    String decode(String data) {
         Pattern pattern=Pattern.compile("(\\d+)(.)");
             // Note: NOT Pattern.CASE_INSENSITIVE
        Matcher matcher=pattern.matcher(data);
        return matcher.replaceAll(matchResult ->  matchResult.group(2).repeat(Integer.parseInt(matchResult.group(1))));
    }

}