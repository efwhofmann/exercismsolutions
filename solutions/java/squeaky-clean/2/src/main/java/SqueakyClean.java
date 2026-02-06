class SqueakyClean {
    static String clean(String input) {
        return input.chars()
                    .map(c -> cleanChar(c))
                    .filter(c -> c>0)
                    .collect(StringBuilder::new,                                 StringBuilder::appendCodePoint,                           StringBuilder::append)
                    .toString();
    }

     static private int cleanChar(int codePt) {
         class upperCaseNext {
             static boolean value=false;
         }
        return switch(codePt){
            case ' ' -> '_';
            case '0' -> 'o';
            case '1' -> 'l';
            case '3' -> 'e';
            case '4' -> 'a';
            case '7' -> 't';
            case '-' -> {
                    upperCaseNext.value = true;
                    yield -1;
                }
            default -> {
                    if (!Character.isLetter(codePt) && !Character.isDigit(codePt)) {yield -1;}
                    if(upperCaseNext.value){
                        upperCaseNext.value = false;
                        yield Character.toUpperCase(codePt);
                    }
                    yield codePt;
                }
            };     
     }
} 