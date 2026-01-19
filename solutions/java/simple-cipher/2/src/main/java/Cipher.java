import java.util.Random;

public class Cipher {

    private String mykey;
    private int keyIdx;
    
    public Cipher() {
        Random random = new Random();
        int left  = 97;
        int right = 122;
        int keylength = 101;
        mykey = random.ints(left, right).limit(keylength)
                .collect(StringBuilder::new, 
                         StringBuilder::appendCodePoint, 
                         StringBuilder::append)
                .toString();
        keyIdx = 0;
    }
    

    public Cipher(String key) {
        mykey = key;
        keyIdx = 0;
    }

    public String getKey() {
        return this.mykey;
    }

    public String encode(String plainText) {
       return oneDirection(plainText, 1);
    }

    public String decode(String cipherText) {
        return oneDirection(cipherText, -1);
    }

    private String oneDirection(String data, int sg) {
        this.keyIdx = 0;
         return data.chars()
                .map(c -> rotateLetter(c,nextKey(),sg))
                .collect(StringBuilder::new, 
                         StringBuilder::appendCodePoint, 
                         StringBuilder::append)
                .toString();
    }
    
     private int rotateLetter(int codePoint, int key, int sg){
        int aa = Character.codePointAt(new char[] {'a'},0);
        int zz = Character.codePointAt(new char[] {'z'},0);
        if(! Character.isLetter(codePoint)) {
            return codePoint;
        } else {
            int newCodePt = codePoint + sg*key; 
            if(newCodePt > zz)
                { newCodePt -= 26;}
            if (newCodePt< aa)
                {newCodePt += 26;}
            return newCodePt;
        }
    }

    private int nextKey() {
        int aa = Character.codePointAt(new char[] {'a'},0);
        char[] keyChar = {this.mykey.charAt(this.keyIdx)};
        this.keyIdx++;
        int len = this.mykey.length();
        if (this.keyIdx >= len)
            this.keyIdx %= len;
        return (Character.codePointAt(keyChar,0)-aa);
    }
}
