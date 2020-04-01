
<!-- README.md is generated from README.Rmd. Please edit that file -->

# promis

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/promis)](https://CRAN.R-project.org/package=promis)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Codecov test
coverage](https://codecov.io/gh/nt-williams/promis/branch/master/graph/badge.svg)](https://codecov.io/gh/nt-williams/promis?branch=master)
[![Travis build
status](https://travis-ci.com/nt-williams/promis.svg?branch=master)](https://travis-ci.com/nt-williams/promis)
<!-- badges: end -->

> Implementation of an S3 vector class for the
> [PROMIS](http://www.healthmeasures.net/explore-measurement-systems/promis)
> health measure

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("nt-williams/promis")
```

## Usage

``` r
df <- tibble::tibble(x = c(45, 20, 80, 60, 72, 33))
df
#> # A tibble: 6 x 1
#>       x
#>   <dbl>
#> 1    45
#> 2    20
#> 3    80
#> 4    60
#> 5    72
#> 6    33
```

Numeric vectors can be converted to a `promis` vector with the
`promis()` function.

``` r
library(promis)

df <- dplyr::mutate(df, x = promis(x, domain = "Physical function"))
df
#> # A tibble: 6 x 1
#>          x
#>   <promis>
#> 1       45
#> 2       20
#> 3       80
#> 4       60
#> 5       72
#> 6       33

df$x
#> <promis_promis[6]>
#> [1] 45 20 80 60 72 33
#> # Domain: Physical function

is_promis(df$x)
#> [1] TRUE
```

`promis` vectors encode information about score cutoffs for the specific
domain. This allows converting numeric PROMIS scores to their categories
by just calling `as.character()`.

``` r
dplyr::mutate(df, cutoff = as.character(x))
#> # A tibble: 6 x 2
#>          x cutoff       
#>   <promis> <chr>        
#> 1       45 Normal limits
#> 2       20 Severe       
#> 3       80 Normal limits
#> 4       60 Normal limits
#> 5       72 Normal limits
#> 6       33 Moderate
```
