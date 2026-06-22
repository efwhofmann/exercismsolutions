class Acronym {

    String acronym;

    Acronym(String phrase) {
        String acro="";
        char[] chPhrase = phrase.toCharArray();
        for(int i=0; i<chPhrase.length; i++){
            if(i==0 ||
               Character.isWhitespace(chPhrase[i-1]) ||
              chPhrase[i-1]=='-'|| chPhrase[i-1]=='_'){
                if(Character.isLetter(chPhrase[i]))
                    acro += chPhrase[i];
              }
        }
        acronym = acro.toUpperCase();
    }

    String get() {
        return acronym;
    }

}
