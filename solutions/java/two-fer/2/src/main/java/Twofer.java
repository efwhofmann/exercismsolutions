public class Twofer {
    public String twofer(String name) {
        String ans;
        ans = name == null ? "One for you, one for me.":
            "One for " +name +", one for me.";       
        return ans;
    }
}
