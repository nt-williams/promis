
valid_domains <- list(
  "Physical function",
  "Pain interference",
  "Pain intensity",
  "Global physical health",
  "Global mental health",
  "Depression"
)

validate_domain <- function(domain) {

  check <- c()
  for (i in 1:length(valid_domains)) {
    x <- domain == valid_domains[[i]]
    check <- append(check, x)
  }
  check <- any(check)

  status <- tryCatch(
    if (check) {
      on.exit()
    } else {
      warning()
    },
    warning = function(w) {
      message("Warning message: Not a supported domain. \nCurrently supported domains are...\n")
      promis_domains()
    }
  )
  invisible(status)
}

promis_domains <- function() {
  for (i in 1:length(valid_domains)) {
    message(valid_domains[[i]])
  }
}


