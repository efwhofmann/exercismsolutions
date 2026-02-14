leap <- function(year) {
  ((bitwAnd(year,3) == 0) && ((bitwAnd(year, 15)==0) || ! (year %% 25 == 0)))
}
