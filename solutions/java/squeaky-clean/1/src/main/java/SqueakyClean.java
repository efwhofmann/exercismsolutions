class SqueakyClean {
    static String clean(String in) {
        char[] input = in.toCharArray();
        StringBuilder out = new StringBuilder();
        String leet = "43017";
        for(int i=0; i<input.length; i++){
            char ch = input[i];
            if(ch==' '){
                out.append('_');
                continue;
            } 
            else if (ch=='-'){
                if (i+1<input.length){
                    i++;
                    char c = input[i];
                    if(Character.isLetter(c)){
                        out.append(                            Character.toUpperCase(c));}
                }                
            }
            else if(leet.indexOf(ch)!=-1){
                int leet_idx = leet.indexOf(ch);
                out.append("aeolt".charAt(leet_idx));
            }
            else if(Character.isLetter(ch) || Character.isDigit(ch)){
                out.append(ch);    
            }
           /* else{
                continue;    
            }*/        
        }
        return out.toString();
    }
    
}
