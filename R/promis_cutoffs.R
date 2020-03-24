
promis_physfx <- function(x) {
  sapply(x, function(x) {
    if (x >= 45)
      "Normal limits"
    else if (x >= 40)
      "Mild"
    else if (x >= 30)
      "Moderate"
    else if (x < 30)
      "Severe"
  }, simplify = TRUE)
}

promis_paininten <- function(x) {
  sapply(x, function(x) {
    if (x <= 55)
      "Normal limits"
    else if (x <= 60)
      "Mild"
    else if (x <= 70)
      "Moderate"
    else if (x > 70)
      "Severe"
  }, simplify = TRUE)
}
