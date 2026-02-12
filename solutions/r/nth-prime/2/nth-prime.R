prime <- function(n) {
  if(n<1)  stop("There is no zeroth prime")
  if(n==1) return(2)
  cand<-3
  i<-2
  while(i<n){
    cand<-cand+2
    if(all(cand %% 3 : ceiling(sqrt(cand)) !=0)) i<-i+1
  }
  cand
}

# inspired by Steffan153's solution