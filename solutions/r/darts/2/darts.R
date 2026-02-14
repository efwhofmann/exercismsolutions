score <- function(x, y) {
  rsq = x^2 + y^2
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
