import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;
import java.util.stream.Collectors;

public class KillerSudokuHelper {

    List<List<Integer>> combinationsInCage(Integer cageSum, Integer cageSize, List<Integer> exclude) {
        ArrayList<Integer> digits = makeDigits(exclude);
        List<List<Integer>> combinations = 
            createCombinations(digits, cageSize);
       return combinations.stream()
                    .filter(cmb -> sumCombo(cmb)==cageSum)
                    .collect(Collectors.toList());
    }
    

    List<List<Integer>> combinationsInCage(Integer cageSum, Integer cageSize) {
        return combinationsInCage(cageSum, cageSize, List.of());
    }

    private ArrayList<Integer> makeDigits(List<Integer> exclude){
        ArrayList<Integer> digits = new ArrayList<Integer>();
        for(int i=1; i<=9; i++){
            if(!exclude.contains(i))
                digits.add(i);
        }
        return digits;
    }

    private int sumCombo(List<Integer> combo){
        return combo.stream().reduce(0, Integer::sum);
    } 

    /* Algorithm for combinations adapted from RosettaCode */
    
    private List<List<Integer>> createCombinations(List<Integer> digits, Integer size){
        List<List<Integer>> combinations = new ArrayList<List<Integer>>();
        createCombinations(digits, size, new ArrayList<Integer>(), combinations, 0);
        return combinations;
    }

    private void createCombinations(List<Integer> digits, Integer size, List<Integer> accumulator, List<List<Integer>> combinations, Integer index){
        if(accumulator.size()==size){
            combinations.addFirst(new ArrayList<Integer>(accumulator));
        } else if (size - accumulator.size()<= digits.size() - index) {
            createCombinations(digits, size, accumulator, 
                               combinations, index + 1);
            accumulator.add(digits.get(index));
            createCombinations(digits, size, accumulator, 
                               combinations, index + 1);
            accumulator.removeLast();
        }
    }

    

}
