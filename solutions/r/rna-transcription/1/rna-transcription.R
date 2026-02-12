library(stringr)

to_rna <- function(dna) {
  d_to_r <- c("C"="G", "G"="C", "T"="A", "A"="U")
  nucleotids_d = unlist(strsplit(dna,""))
  rna_v = d_to_r[nucleotids_d]    
  if (NA %in% rna_v){
    stop("invalid DNA")
  }
  str_flatten(rna_v)  
}
