raindrops <- function(number) {
  s3 <- if (number %% 3 == 0) "Pling" else ""
  s5 <- if (number %% 5 == 0) "Plang" else ""
  s7 <- if (number %% 7 == 0) "Plong" else ""
  sounds = paste(s3,s5,s7, sep="") 
  if (sounds == "") {
    as.character(number) 
  } else {
    sounds
  } 
}
