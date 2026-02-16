nucleotide_count <- function(input) {
  counts <- c("A"=0, "C"=0, "G"=0, "T"=0)
  if(input!=""){
   strand <- unlist(strsplit(input,""))
    for(n in strand){
      if(is.na(counts[n])){stop()}
      counts[n] <- counts[n]+1
    }
  }
  as.list(counts)
}
