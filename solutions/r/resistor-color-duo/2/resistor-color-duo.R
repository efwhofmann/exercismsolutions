value <- function(resistor_colors) {
  color_vals <- c(black=0, brown=1, red=2, orange=3,
              yellow=4, green=5, blue=6, violet=7,
              grey=8, white=9)
  v1 <- color_vals[resistor_colors[1]]
  v2 <- color_vals[resistor_colors[2]]
  as.integer(10*v1  + v2)
}
