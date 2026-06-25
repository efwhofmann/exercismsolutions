import java.util.List;
import java.util.ArrayList;

class FlowerFieldBoard {

   
    ArrayList<String> numberedBoard;

    FlowerFieldBoard(List<String> garden) {
        numberedBoard = new ArrayList<String>();
        
        int height = garden.size();
        if (height==0) return;
        
        int width = garden.get(0).length();
        for(int y=0; y<height; y++){
            String row = "";
            for(int x=0; x<width; x++){
                if(garden.get(y).charAt(x)=='*')
                    row += '*';
                else {
                   int count=0;
                    for(int dx = -1; dx<=1; dx++){
                        for(int dy=-1; dy<=1; dy++){
                            int newY = y + dy;
                            int newX = x + dx;
                            if(0<=newX && newX<width 
                                && 0<=newY && newY<height
                                && garden.get(newY)
                                   .charAt(newX)=='*') 
                                    count++;
                        }}
                     row += count>0 ? 
                         Integer.toString(count) : ' '; 
                    }
                    
                }
                numberedBoard.add(row);
            }
    }
    

    List<String> withNumbers() {
       return numberedBoard;
    }

}