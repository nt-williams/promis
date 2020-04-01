
new_promis <- function(x = double(), domain = character()) {

  vec_assert(x, double())
  vec_assert(domain, ptype = character(), size = 1L)

  validate_domain(domain)

  new_vctr(validate_value(x), domain = domain, class = "promis_promis")

}

# for compatibility with the S4 system
methods::setOldClass(c("promis_promis", "vctrs_vctr"))

#' `promis` vector
#'
#' @param x
#'  * For `promis()`: A numeric vector.
#'  * For `is_promis()`: A vector to test.
#' @param domain A character string specifying the PROMIS domain. Currently supported domains are:
#'  * Physical function
#'  * Pain interference
#'  * Pain intensity
#'  * Global physical health
#'  * Global mental health
#'  * Depression
#'
#' @return An S3 vector of class `promis_promis`.
#' @export
#'
#' @examples
#' promis(c(45, 60, 65), domain = "Physical function")
promis <- function(x = double(), domain = character()) {
  out <- vec_cast(x, double())
  new_promis(out, domain)
}

#' @export
#' @rdname promis
is_promis <- function(x) {
  inherits(x, "promis_promis")
}

#' @export
vec_ptype_abbr.promis_promis <- function(x, ...) {
  "promis"
}

#' @export
obj_print_footer.promis_promis <- function(x, ...) {
  cat("# Domain: ", attr(x, "domain"), "\n", sep = "")
}

domain <- function(x) attr(x, "domain")

# coercion ----------------------------------------------------------------

#' @method vec_ptype2 promis_promis
#' @export
#' @export vec_ptype2.promis_promis
#' @rdname promis-vctrs
vec_ptype2.promis_promis <- function(x, y, ...) UseMethod("vec_ptype2.promis_promis", y)

#' @method vec_ptype2.promis_promis default
#' @export
vec_ptype2.promis_promis.default <- function(x, y, ..., x_arg = "x", y_arg = "y") {
  vec_default_ptype2(x, y, x_arg = x_arg, y_arg = y_arg)
}

# promis/promis

#' @method vec_ptype2.promis_promis promis_promis
#' @export
vec_ptype2.promis_promis.promis_promis <- function(x, y, ...) {
  stopifnot(domain(x) == domain(y))
  promis(domain = domain(x))
}

# promis/double

#' @method vec_ptype2.promis_promis double
#' @export
vec_ptype2.promis_promis.double <- function(x, y, ...) double()

#' @method vec_ptype2.double promis_promis
#' @export
vec_ptype2.double.promis_promis <- function(x, y, ...) double()

# promis/character

#' @method vec_ptype2.promis_promis character
#' @export
vec_ptype2.promis_promis.character <- function(x, y, ...) character()

#' @method vec_ptype2.character promis_promis
#' @export
vec_ptype2.character.promis_promis <- function(x, y, ...) character()

# casting -----------------------------------------------------------------

#' @method vec_cast promis_promis
#' @export vec_cast.promis_promis
#' @export
#' @rdname promis-vctrs
vec_cast.promis_promis <- function(x, to, ...) UseMethod("vec_cast.promis_promis")

#' @method vec_cast.promis_promis default
#' @export
vec_cast.promis_promis.default <- function(x, to, ...) vec_default_cast(x, to)

# promis/promis

#' @method vec_cast.promis_promis promis_promis
#' @export
vec_cast.promis_promis.promis_promis <- function(x, to, ...) {
  new_promis(vec_data(x), domain = domain(to))
}

# promis/double

#' @method vec_cast.promis_promis double
#' @export
vec_cast.promis_promis.double <- function(x, to, ...) promis(x, domain = domain(to))

#' @method vec_cast.double promis_promis
#' @export
vec_cast.double.promis_promis <- function(x, to, ...) vec_data(x)

# promis/character

#' @method vec_cast.character promis_promis
#' @export
vec_cast.character.promis_promis <- function(x, to, ...) {
  switch(domain(x),
         "Physical function" = promis_adult_profile_function(vec_data(x)),
         "Pain intensity" = promis_adult_profile_symptoms(vec_data(x)),
         "Pain interference" = promis_adult_profile_symptoms(vec_data(x)),
         "Global physical health" = promis_adult_global_health(vec_data(x)),
         "Global mental health" = promis_adult_global_mental(vec_data(x)))
}

