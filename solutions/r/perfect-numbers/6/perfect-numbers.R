aliquot <- function(n){
  sq_root <- floor(sqrt(n))
  range <- 1:sq_root
  small_factors <- range[n %% range == 0]  
  factors = c(small_factors, n/small_factors)  
  aliquot = sum(factors) - n - ifelse(sq_root^2 == n, sq_root, 0)
}

number_type <- function(n){
  if(n<1) stop("not a natural number")
  if(n==1) return("deficient")
  c('deficient', 'perfect', 'abundant')[sign(aliquot(n)-n)+2]
}
