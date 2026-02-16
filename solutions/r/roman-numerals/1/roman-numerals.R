roman <- function(arabic) {
  stopifnot(arabic>0 & arabic<=3999)
  tens <- c(1000,100,10,1)
  romantens <- c('M','C','X','I')
  romanfives <- c('D','L','V')
  res <- ""
  for(d in 1:4) {
    str <- ""
    q <- arabic %/% tens[d]
    arabic <- arabic %% tens[d]
    if(d==0 | q<4) {
      str <- paste(rep(romantens[d],q),collapse='')
    }
    else if(d>=1 & q==9){
      str <- paste(c(romantens[d],romantens[d-1]), collapse='')
    }
    else if(d>=1 & q>=5){
       str <- paste(c(romanfives[d-1],rep(romantens[d],(q-5))),collapse='')
    }
    else {
      str <- paste(c(romantens[d], romanfives[d-1]), collapse='')
    }
    res <- paste0(res,str)  
  }
res
}
