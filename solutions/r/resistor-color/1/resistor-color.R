colors <- c("black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white")

color_code <- function(color) {
  match(tolower(color),colors)-1
}
