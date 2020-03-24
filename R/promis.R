
new_promis <- function(x = double(), aspect = character(), domain = character()) {

  vec_assert(x, double())
  vec_assert(aspect, ptype = character(), size = 1L)
  vec_assert(domain, ptype = character(), size = 1L)

  new_vctr(x, aspect = aspect, domain = domain, class = "promis_promis")

}

promis <- function(x = double(), aspect = character(), domain = character()) {
  out <- vec_cast(x, double())
  new_promis(out, aspect, domain)
}

is_promis <- function(x) {
  inherits(x, "promis_promis")
}

vec_ptype_abbr.promis_promis <- function(x, ...) {
  "promis"
}

obj_print_footer.promis_promis <- function(x, ...) {
  cat("# Aspect: ", attr(x, "aspect"), "\n", sep = "")
  cat("# Domain: ", attr(x, "domain"), "\n", sep = "")
}
