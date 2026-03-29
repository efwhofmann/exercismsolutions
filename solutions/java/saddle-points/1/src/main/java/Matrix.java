import java.util.*;
import java.util.stream.*;

class Matrix {

    private List<List<Integer>> m_rows;
    private List<List<Integer>> m_cols;
    private Set<MatrixCoordinate> saddle_pts;

    Matrix(List<List<Integer>> values) {
        m_rows = values;
        if (m_rows.size()==0){
            m_cols = new ArrayList<>();    
            saddle_pts = new HashSet<>();
        } else {
            m_cols = transpose(m_rows);
            saddle_pts = findSaddlePoints();
        }
    }

    Set<MatrixCoordinate> getSaddlePoints() {
        return saddle_pts;
    }

    private Set<MatrixCoordinate> findSaddlePoints() {
        Set<MatrixCoordinate>points = new HashSet<>();
        for (int r = 0; r<m_rows.size(); r++) {
            List<Integer> the_row = m_rows.get(r);
            int m = Collections.max(the_row);
            for(int c = 0; c<the_row.size(); c++){
               int mc = Collections.min(m_cols.get(c));
               if(mc == m){
                   points.add(new MatrixCoordinate(r+1,c+1));
               }
            }
        } 
        return points;
    }        
    
    
    private List<List<Integer>> transpose(List<List<Integer>> matrix){
        return IntStream.range(0, m_rows.get(0).size())
            .mapToObj(col -> 
                       IntStream.range(0, m_rows.size())
                        .mapToObj(row -> m_rows.get(row).get(col))
                        .collect(Collectors.toList())
            ).collect(Collectors.toList());
    }
}
