import java.util.List;
import java.util.ArrayList;

class PrimeFactorsCalculator {

    List<Long> calculatePrimeFactorsOf(long number) {
        List<Long> factors = new ArrayList<>();
        if (number<=1) {
            return factors;
        }
        double sq = Math.sqrt(number);
        for(long k=2; k<= sq; k++){
            while(number%k==0){
                factors.add(k);
                number /=k;
            }                
        }
        if(number >1)
            factors.add(number);
        return factors;
    }

}