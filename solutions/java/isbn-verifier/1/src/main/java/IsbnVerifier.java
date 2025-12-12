import java.util.*;
import java.util.*;

class IsbnVerifier {

    boolean isValid(String stringToVerify) {
        char[] chars = stringToVerify.toCharArray();
        int sum=0;
        int factor=10;
        for (char ch : chars) {
            if(ch == '-')
                continue;
            Boolean is_valid = (Character.isDigit(ch)||
                          (ch=='X' && factor==1));
            if (!is_valid){
                return false;
            } else {
                int value = ch=='X' ? 10 : Character.getNumericValue(ch);
                sum += factor*value;
                factor--;
            }
        }
        return factor==0 && sum %11 == 0;
    }

}
