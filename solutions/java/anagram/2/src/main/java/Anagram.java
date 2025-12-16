import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;

class Anagram {
    String lowercase_word;
    Map<Character,Integer> letter_map;
    
    private Map<Character,Integer> word_to_map(String lc_word){
        Map<Character, Integer> lt_map = new HashMap<>();
        for(char ch : lc_word.toCharArray()){
            lt_map.merge(ch,1,Integer::sum);
        }
        return lt_map;
    }

    public Anagram(String word) {
        lowercase_word = word.toLowerCase();
        letter_map = word_to_map(lowercase_word);        
    }

    public List<String> match(List<String> candidates) {
        List<String> result = new ArrayList<>();
        for(String cand : candidates){
            String candidate = cand.toLowerCase();
            if(candidate.equals(lowercase_word)){
                continue;
            }
            Map<Character, Integer> candidate_map = word_to_map(candidate);
           if(candidate_map.equals(letter_map)){
                result.add(cand);
            }
        }
        return result;
    }

}