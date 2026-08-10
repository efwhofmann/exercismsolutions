class GameOfLife {
  List<List<int>> _matrix;

  GameOfLife(matrixIn) : _matrix = matrixIn;
  
  List<List<int>> matrix() => _matrix;
  

  void tick(){
    if (_matrix.isEmpty)
      return;
    final rows  = _matrix.length;
    final cols =  _matrix[0].length;
    final nextStep = List.generate(rows, 
                          (_) => List.filled(cols, 0));  
    for(var i=0; i<rows; i++){
      for(var j=0; j<cols; j++){
        var sum = countNeighbors(i,j);
         nextStep[i][j] = ((3==sum) || 
                           (1== _matrix[i][j] && 2==sum)) ?
                             1 : 0;   
      }
    }
    _matrix = nextStep;    
  }

  int countNeighbors(int i, int j){
    final rows  = _matrix.length;
    final cols =  _matrix[0].length;
    int sum = 0;
    sum  += (i>0 && j>0) ? _matrix[i-1][j-1] : 0;
    sum  += (i>0) ? _matrix[i-1][j]: 0; 
    sum += (i>0 && j+1<cols) ? _matrix[i-1][j+1] : 0;
    sum += (j>0) ? _matrix[i][j-1] : 0;
    sum += (j+1<cols) ? _matrix[i][j+1] : 0;
    sum  += (i+1<rows && j>0) ? _matrix[i+1][j-1] : 0;
    sum  += (i+1<rows) ? _matrix[i+1][j]: 0;
    sum += (i+1<rows && j+1<cols) ? _matrix[i+1][j+1] : 0;
    return sum;
  }

  
}
