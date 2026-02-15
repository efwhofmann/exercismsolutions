prime_factors <- function(number) {
  factors <- c()  
  for(k in 2:floor(sqrt(number))){
    if(number==1) break
    while(number%%k ==0){
      factors <- c(factors,k)
      number <- number/k
    }
  }
  if(number!=1) factors<-c(factors, number)
  factors  
}
