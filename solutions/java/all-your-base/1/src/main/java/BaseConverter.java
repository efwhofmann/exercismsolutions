import java.util.List;
import java.util.ArrayList;


class BaseConverter {

    int myValue = 0;

    BaseConverter(int originalBase, int[] originalDigits) {
        if(originalBase<2){
           throw new IllegalArgumentException("Bases must be at least 2.");
        }
        int myBase = originalBase;
        int power = 1; 
        for(int i=originalDigits.length-1; i>=0; i--){
            int d=originalDigits[i];
            if(d<0) {
                throw new IllegalArgumentException("Digits may not be negative.");
            }
            else if(d>=myBase){
                 throw new IllegalArgumentException("All digits must be strictly less than the base.");
            }
            myValue += originalDigits[i]*power;
            power *= myBase;
        }
    }

    int[] convertToBase(int newBase) {
       if(newBase<2){
           throw new IllegalArgumentException("Bases must be at least 2.");
        }
        if(0==myValue)
            return new int[]{0};
        int num = myValue;
        List<Integer> newDigits = new ArrayList<>();
        while (num>0){
            newDigits.addFirst(num % newBase);
            num /= newBase;
        }
        int[] digits = new int[newDigits.size()];
        for(int i=0; i<digits.length; i++){
            digits[i] = newDigits.get(i);
        }
        return digits;
    }

}