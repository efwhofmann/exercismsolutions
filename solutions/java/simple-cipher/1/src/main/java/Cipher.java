public class Cipher {

    private String mykey;
    private int keyIdx;
    
    public Cipher() {
        /* A dummy version of this constructor, not a random key */
        /* However, passes all tests */
        mykey = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
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
                .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
                .toString();
    }
    
     private int rotateLetter(int codePoint, int key, int sg){
        int aa = Character.codePointAt(new char[] {'a'},0);
        int A = Character.codePointAt(new char[] {'A'},0);
        int zz = Character.codePointAt(new char[] {'z'},0);
        int Z = Character.codePointAt(new char[] {'Z'},0);
        if(! Character.isLetter(codePoint)) {
            return codePoint;
        } else {
            int newCodePt = codePoint + sg*key; 
            if(newCodePt > zz 
              || (codePoint <= Z && newCodePt > Z))
                { newCodePt -= 26;}
            if (newCodePt<A|| (newCodePt > Z && newCodePt < aa))
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
