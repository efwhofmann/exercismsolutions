public class Twofer {
    public String twofer(String name) {
        String ans;
        if(null==name){
            ans = "One for you, one for me.";
        } else {
            ans =  "One for " +name +", one for me.";
        }
        return ans;
    }
}
