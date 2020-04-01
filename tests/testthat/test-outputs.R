
test_that("numeric vectors are printed corrently", {
  verify_output(test_path("test-print-proper-numeric.txt"), {
    x <- c(50, 45, 20, 80, 60)
    promis(x, domain = "Physical function")
  })
})

test_that("converts non-supported values to NA", {
  verify_output(test_path("test-convert-NA.txt"), {
    x <- c(50, 45, 20, 100, 60)
    promis(x, domain = "Physical function")
  })
})

test_that("detect invalid domains", {
  verify_output(test_path("test-invalid-domain.txt"), {
    x <- c(50, 45, 20, 80, 60)
    promis(x, domain = "An invalid domain")
  })
})
