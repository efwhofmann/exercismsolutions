# This is a stub function to take two strings
# and calculate the hamming distance
hamming <- function(strand1, strand2) {
  stopifnot(nchar(strand1) == nchar(strand2))
  if(strand1=="") return(0)
  s1 <- strsplit(strand1,"")[[1]]
  s2 <- strsplit(strand2,"")[[1]]
  len <- length(s1)
  dist <- 0
  for(i in 1:len){
      n1 <- s1[i]
      n2 <- s2[i]
      if(n1!= n2){  
        dist <- dist+1 }
    }
  dist
  }
