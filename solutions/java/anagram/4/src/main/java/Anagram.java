import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.stream.Collectors;

class Anagram {
    String lowercase_word;
    Map<Character,Integer> letter_map;
   
    public Anagram(String word) {
        lowercase_word = word.toLowerCase();
        letter_map = word_to_map(lowercase_word);        
    }

    public List<String> match(List<String> candidates) {
        return candidates
            .stream()
            .filter(this::isAnagram)
            .collect(Collectors.toList());
    }
    
    private Map<Character,Integer> word_to_map(String lc_word){
        Map<Character, Integer> lt_map = new HashMap<>();
        for(char ch : lc_word.toCharArray()){
            lt_map.merge(ch,1,Integer::sum);
        }
        return lt_map;
    }
    
    private boolean isAnagram(String cand){
        String lc_cand = cand.toLowerCase();
        return(!lc_cand.equals(lowercase_word) &&  letter_map.equals(word_to_map(lc_cand)));
    }
}