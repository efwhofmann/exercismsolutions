class Darts {
  int score(double x, double y){
    var ds = x*x + y*y;
    int score = 0;
    switch(ds){
      case >=0 && <=1 : score=10;
      case >1 && <=25 : score=5;
      case >25 && <=100 : score=1;
      default: score = 0;
    }
    return score;
  }
}
