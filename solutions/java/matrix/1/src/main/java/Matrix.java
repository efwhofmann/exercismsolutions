import java.util.List;
import java.util.ArrayList;
import java.util.stream.Stream;
import java.util.stream.Collectors;


class Matrix {

    ArrayList<List<Integer>> rows;

    Matrix(String matrixAsString) {
       rows = new ArrayList<List<Integer>>();
       String[] strRows = matrixAsString.split("\n");
       for(String str : strRows){
           List<Integer> curRow = Stream.of(str.split(" "))
               .map(Integer::valueOf)
               .collect(Collectors.toList());
            rows.add(curRow);
        }
    }

    int[] getRow(int rowNumber) {
        return rows.get(rowNumber-1).stream()
            .mapToInt(Integer::intValue).toArray();           
    }

    int[] getColumn(int columnNumber) {
        int  colIdx = columnNumber-1;
        int[] theCol = new int[rows.size()];
        for(int i=0; i<rows.size(); i++){
            theCol[i] = rows.get(i).get(colIdx);
        }
        return theCol;
    }
}
