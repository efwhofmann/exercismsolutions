import java.util.Random;

public class Cipher {

    private String mykey;
    private int keyIdx;
    static private int aa = 97;
    static private int zz = 122;
    
    public Cipher() {
        Random random = new Random();
        int keylength = 101;
        mykey = random.ints(aa,zz).limit(keylength)
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
        char[] keyChar = {mykey.charAt(keyIdx)};
        keyIdx++;
        int len = mykey.length();
        if (keyIdx >= len)
            keyIdx %= len;
        return (Character.codePointAt(keyChar,0)-aa);
    }
}
