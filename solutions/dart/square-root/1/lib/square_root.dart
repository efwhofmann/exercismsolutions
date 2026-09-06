class SquareRoot {
  int squareRoot(int n){
    var x = 0.75*n;
    while(x.floor()*x.floor()!=n){
       x  = 0.5*(x + n/x);    
    }
  return x.floor();
  }
}
