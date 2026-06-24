public class EliudsEggs {
    public int eggCount(int number) {
        int sum=0;
        while(number>0){
            sum += (number & 1);
            number>>=1;
        }
        return sum;
    }
}
