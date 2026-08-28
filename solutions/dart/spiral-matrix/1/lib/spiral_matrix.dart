class SpiralMatrix {
  int n;

  SpiralMatrix(this.n);

  List<List<int>> toList(){
    var matrix = List.generate(n, (r)=>  List<int>.generate(n, (c)=>0, growable: false));
    final List<List<int>> deltas
      = [ [0,1], [1,0], [0,-1], [-1,0]];
    int posX = 0;
    int posY = 0;   
    int dir = 0;
    for(var k=1; k<=n*n; k++){
      matrix[posY][posX] = k;
      int nextY = posY + deltas[dir][0];
      int nextX = posX + deltas[dir][1];
      if(nextX >= n || nextX<0 || nextY>=n || nextY<0 
        || matrix[nextY][nextX]!=0){
          dir = (dir + 1) % 4;
        }
      posY += deltas[dir][0];
      posX += deltas[dir][1];
    }
    return matrix;
    }
}
