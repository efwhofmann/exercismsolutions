sigma <- function(n){
  range <- 1:floor(n/2)
  factors <- range[n %% range == 0]
  sum(factors)
}

number_type <- function(n){
  if(n<1) stop("not a natural number")
  if(n==1) return("deficient")
  c('deficient', 'perfect', 'abundant')[sign(sigma(n)-n)+2]
}
