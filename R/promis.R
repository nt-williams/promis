
new_promis <- function(x = double(), domain = character()) {

  vec_assert(x, double())
  vec_assert(domain, ptype = character(), size = 1L)

  validate_domain(domain)

  new_vctr(validate_value(x), domain = domain, class = "promis_promis")

}

promis <- function(x = double(), domain = character()) {
  out <- vec_cast(x, double())
  new_promis(out, domain)
}

is_promis <- function(x) {
  inherits(x, "promis_promis")
}

vec_ptype_abbr.promis_promis <- function(x, ...) {
  "promis"
}

obj_print_footer.promis_promis <- function(x, ...) {
  cat("# Domain: ", attr(x, "domain"), "\n", sep = "")
}

domain <- function(x) attr(x, "domain")

# coercion ----------------------------------------------------------------

vec_ptype2.promis_promis <- function(x, y, ...) UseMethod("vec_ptype2.promis_promis", y)

vec_ptype2.promis_promis.default <- function(x, y, ..., x_arg = "x", y_arg = "y") {
  vec_default_ptype2(x, y, x_arg = x_arg, y_arg = y_arg)
}

# promis/promis
vec_ptype2.promis_promis.promis_promis <- function(x, y, ...) {
  stopifnot(domain(x) == domain(y))
  promis(domain = domain(x))
}

# promis/double
vec_ptype2.promis_promis.double <- function(x, y, ...) double()
vec_ptype2.double.promis_promis <- function(x, y, ...) double()

# promis/character
vec_ptype2.promis_promis.character <- function(x, y, ...) character()
vec_ptype2.character.promis <- function(x, y, ...) character()

# casting -----------------------------------------------------------------

vec_cast.promis_promis <- function(x, to, ...) UseMethod("vec_cast.promis_promis")

vec_cast.promis_promis.default <- function(x, to, ...) vec_default_cast(x, to)

# promis/promis
vec_cast.promis_promis.promis_promis <- function(x, to, ...) {
  new_promis(vec_data(x), domain = domain(to))
}

# promis/double
vec_cast.promis_promis.double <- function(x, to, ...) promis(x, domain = domain(to))
vec_cast.double.promis_promis <- function(x, to, ...) vec_data(x)

# promis/character
vec_cast.character.promis_promis <- function(x, to, ...) {
  switch(domain(x),
         "Physical function" = promis_adult_profile_function(vec_data(x)),
         "Pain intensity" = promis_adult_profile_symptoms(vec_data(x)),
         "Pain interference" = promis_adult_profile_symptoms(vec_data(x)),
         "Global physical health" = promis_adult_global_health(vec_data(x)),
         "Global mental health" = promis_adult_global_mental(vec_data(x)))
}

