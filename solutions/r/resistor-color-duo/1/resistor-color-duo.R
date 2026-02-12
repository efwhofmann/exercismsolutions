value <- function(resistor_colors) {
  colors <- c("black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white")
  10* (match(tolower(resistor_colors[1]),colors)-1) +
    match(tolower(resistor_colors[2]),colors)-1
}
