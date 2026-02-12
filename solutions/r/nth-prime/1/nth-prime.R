prime <- function(n) {
  if(n<1){
    stop("There is no zeroth prime")
  }
  primes <-rep(NA,times=n)
  primes[1] <- 2
  cand <-3 
  idx = 1
  while(idx<n){
    is_prime <- TRUE
    for(p in primes[1:idx]){
      if(cand %% p == 0){
        is_prime <- FALSE
        break
      }
    }
    if(is_prime){
      idx <- idx+1
      primes[idx]<-cand
     }
    cand <- cand+2
  }
  #print(primes)
  primes[n]
}
