score <- function(x, y) {
  rsq = x*x + y*y
  score<-if(rsq<=1){
    10 
  } else if(rsq<=25){
    5
  } else if (rsq<=100){
    1
  } else {
    0
  }
}
