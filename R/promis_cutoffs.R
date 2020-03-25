
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

promis_ped_parent_profile <- function(x) {
  sapply(x, function(x) {
    if (x <= 50)
      "Normal limits"
    else if (x <= 55)
      "Mild"
    else if (x <= 65)
      "Moderate"
    else if (x > 65)
      "Severe"
  }, simplify = TRUE)
}

promis_ped_parent_profile_sleep <- function(x) {
  sapply(x, function(x) {
    if (x <= 55)
      "Normal limits"
    else if (x <= 59)
      "Mild"
    else if (x <= 65)
      "Moderate"
    else if (x > 65)
      "Severe"
  }, simplify = TRUE)
}

promis_ped_parent_profile_relation <- function(x) {
  sapply(x, function(x) {
    if (x >= 60)
      "Excellent"
    else if (x >= 40)
      "Good"
    else if (x >= 30)
      "Fair"
    else if (x < 30)
      "Poor"
  }, simplify = TRUE)
}

promis_vl_vh <- function(x) {
  sapply(x, function(x) {
    if (x <= 30)
      "Very low"
    else if (x <= 40)
      "Low"
    else if (x <= 60)
      "Average"
    else if (x <= 70)
      "High"
    else if (x > 70)
      "Very high"
  }, simplify = TRUE)
}

promis_adult_global_health <- function(x) {
  sapply(x, function(x) {
    if (x >= 58)
      "Excellent"
    else if (x >= 50)
      "Very good"
    else if (x >= 42)
      "Good"
    else if (x >= 35)
      "Fair"
    else if (x < 35)
      "Poor"
  }, simplify = TRUE)
}

promis_adult_global_mental <- function(x) {
  sapply(x, function(x) {
    if (x >= 56)
      "Excellent"
    else if (x >= 48)
      "Very good"
    else if (x >= 40)
      "Good"
    else if (x >= 29)
      "Fair"
    else if (x < 29)
      "Poor"
  }, simplify = TRUE)
}

promis_ped_global_health <- function(x) {
  sapply(x, function(x) {
    if (x >= 42)
      "Good"
    else if (x >= 37)
      "Fair"
    else if (x < 36)
      "Poor"
  }, simplify = TRUE)
}

promis_parent_global_health <- function(x) {
  sapply(x, function(x) {
    if (x >= 45)
      "Good"
    else if (x >= 36)
      "Fair"
    else if (x < 36)
      "Poor"
  }, simplify = TRUE)
}
