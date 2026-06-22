class Acronym {

    String acronym;

    Acronym(String phrase) {
        String acro="";
        String[] words =  phrase.split("[\s_-]+");
        for(String w: words){
            acro += w.charAt(0);
        }        
        acronym = acro.toUpperCase();
    }

    String get() {
        return acronym;
    }

}
