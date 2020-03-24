
promis_adult_profile_function <- function(x) {
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

promis_adult_profile_symptoms <- function(x) {
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

promis_pediatric_profile <- function(x) {
  sapply(x, function(x) {
    # TODO
  }, simplify = TRUE)
}

promis_pediatric_profile_sleep <- function(x) {
  sapply(x, function(x) {
    # TODO
  }, simplify = TRUE)
}

promis_pediatric_profile_relation <- function(x) {
  sapply(x, function(x) {
    # TODO
  }, simplify = TRUE)
}

promis_vl_vh_one <- function(x) {
  sapply(x, function(x) {
    # TODO
  }, simplify = TRUE)
}

promis_vl_vh_two <- function(x) {
  sapply(x, function(x) {
    # TODO
  }, simplify = TRUE)
}

promis_adult_global_health <- function(x) {
  sapply(x, function(x) {
    # TODO
  }, simplify = TRUE)
}

promis_adult_global_mental <- function(x) {
  sapply(x, function(x) {
    # TODO
  }, simplify = TRUE)
}

promis_pediatric_global_health <- function(x) {
  sapply(x, function(x) {
    # TODO
  }, simplify = TRUE)
}
