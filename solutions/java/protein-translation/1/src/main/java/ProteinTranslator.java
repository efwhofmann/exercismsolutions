import java.util.List;
import java.util.ArrayList;
import java.util.Map;


class ProteinTranslator {

    Map<String,String> amino_map = Map.ofEntries(
        Map.entry("AUG", "Methionine"),
        Map.entry("UUU", "Phenylalanine"),
        Map.entry("UUC", "Phenylalanine"),
        Map.entry("UUA", "Leucine"),
        Map.entry("UUG", "Leucine"),
        Map.entry("UCU", "Serine"),
        Map.entry("UCC", "Serine"),
        Map.entry("UCA", "Serine"),
        Map.entry("UCG", "Serine"),
        Map.entry("UAU", "Tyrosine"),
        Map.entry("UAC", "Tyrosine"),
        Map.entry("UGU", "Cysteine"),
        Map.entry("UGC", "Cysteine"),
        Map.entry("UGG", "Tryptophan"),
        Map.entry("UAA", "STOP"),
        Map.entry("UAG", "STOP"),
        Map.entry("UGA", "STOP") );

    List<String> translate(String rnaSequence) {
        List<String> result = new ArrayList<String>();
        List<String> codons = new ArrayList<String>();
        int len = rnaSequence.length();
        for (int i=0; i<len; i+=3) {
            codons.add(rnaSequence.substring(i, Math.min(i+3, len)));
        }    
        for(String codon : codons){
            String acid = amino_map.get(codon);
            if(acid!=null){
                if(acid=="STOP"){
                    break;
                } else {
                    result.add(acid);
                }
            } else {
                throw new IllegalArgumentException("Invalid codon");
            }
        }
        return result;
    }
}
