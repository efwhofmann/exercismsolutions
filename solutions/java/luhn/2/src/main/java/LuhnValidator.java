import java.util.regex.Pattern;
import java.util.stream.IntStream;

class LuhnValidator {

    boolean isValid(String candidate) {
        String cand = candidate.replace(" ","");
        if(cand.length()<2 || cand.matches("[^0-9]"))
            return false;
        
        int[] values =     
            cand.chars()
            .map(Character::getNumericValue)
            .toArray();
        
        int len = values.length;
        return IntStream.range(0, len)
            .mapToObj(i->
                      ((len-i)%2 == 0 && values[i]!=9) ?
                      (2*values[i]%9) : values[i])
            .reduce(0,Integer::sum) % 10 == 0;
    }

}
