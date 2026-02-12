sigma <- function(n){
  sum <- 0
  for(k in 1:floor(n/2)){
    if(n%%k==0) sum <- sum + k
  }
  sum
}

number_type <- function(n){
  #stopifnot(n>=1)
  if(n<1) stop("not a natural number")
  if(n==1) return("deficient")
  a <- sigma(n)
  type <- "abundant"
  if (a<n) type <- "deficient"
  if (a==n) type <- "perfect"
  type
}
