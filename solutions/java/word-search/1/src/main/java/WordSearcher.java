import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

class WordSearcher {

    Pair lookFrom(final char[][] grid, String word, int row, int col){
        int height = grid.length;
        int width = grid[0].length;
        int len = word.length();
        for(int dh=-1; dh<=1; dh++){
            for(int dv=-1; dv<=1; dv++){
                if(0==dv && 0==dh)
                    continue;
                String line = "";
                int k=0;
                while(k<len){
                    int newc = col + k*dh;
                    int newr = row + k*dv;
                    if(newc<0 || newr<0 || 
                       newc>= width || newr>= height)
                        break;
                    if(word.charAt(k) != grid[newr][newc]) break;
                    k++;
                }
                if(k==len){
                    return new Pair(col+1 + dh*(len-1), row +1 + dv*(len-1));
                }
            }
        }
        return null;
    }
    
    Map<String, Optional<WordLocation>> search(final Set<String> words, final char[][] grid) {
       int height = grid.length;
       int width = grid[0].length;
        Map<String, Optional<WordLocation>> searchResult = new HashMap<>();
        for(String word : words){  
            searchResult.put(word, Optional.empty());
            for(int row = 0; row<height; row++){
                for(int col = 0; col<width; col++){    
                    if(word.charAt(0)==grid[row][col]){
                        Pair endPt = lookFrom(grid, word, row, col);
                        if(endPt != null){
                            Pair startPt = new Pair(col+1, row+1);
                            searchResult.put(word, 
                                 Optional.of(
                                    new WordLocation(
                                    startPt, endPt)
                                 ));
                        }
                    }                    
                }
            }
        }
        return searchResult;
    }
}
