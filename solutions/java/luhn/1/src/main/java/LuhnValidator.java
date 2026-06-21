import java.util.regex.Pattern;

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
        int sum = 0;
        for(int i = 0; i<len; i++){
            sum += ((len-i)%2 == 0 && values[i]!=9) ? (2*values[i]%9) : values[i];        
        }
        return 0 == sum%10;
    }

}
