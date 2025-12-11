import java.util.HashSet;
import java.util.Set;

class SumOfMultiples {

    Set<Integer> factors; 
    int num;

    SumOfMultiples(int number, int[] set) {
        factors = new HashSet<Integer>();
        for(int f : set) {
            factors.add(f);
        }
        num =  number;
    }

    int getSum() {
        Set<Integer> s = new HashSet<Integer>();
        int l=0;
        int sum=0;
        for(int f : factors){
            for(int m=f; m<num && m!=0; m+=f){
                s.add(m);
                if(l !=s.size()){
                    l++;
                    sum +=m;
                }
            }
        }
        return sum;
    }

}
