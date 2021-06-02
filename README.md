
<!-- README.md is generated from README.Rmd. Please edit that file -->

# malariahts

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/malariahts)](https://CRAN.R-project.org/package=malariahts)
[![R-CMD-check](https://github.com/njtierney/malariahts/workflows/R-CMD-check/badge.svg)](https://github.com/njtierney/malariahts/actions)
[![Codecov test
coverage](https://codecov.io/gh/njtierney/malariahts/branch/main/graph/badge.svg)](https://codecov.io/gh/njtierney/malariahts?branch=main)
<!-- badges: end -->

The goal of malariahts is to provide tools around fitting hierarchical
time series models for data commonly found in malaria.

## Installation

You can install the released version of malariahts from GitHub with:

``` r
# install.packages("remotes")
remotes::install_github("njtierney/malariahts")
```

### Installing INLA

This package requires `INLA` - if it didn’t install, try the following
to install it

``` r
options(
  repos = c(
    INLA = "https://inla.r-inla-download.org/R/testing",
    CRAN = "https://cloud.r-project.org/"
    )
)

install.packages("INLA")
```

## Example

``` r
library(malariahts)
# for nice table printing
library(tibble)
```

There are two example datasets.

1.  `who_regions`, containing region information from WHO database

``` r
who_regions
#> # A tibble: 110 x 4
#>    who_region who_subregion country     country_iso_code
#>    <chr>      <chr>         <chr>       <chr>           
#>  1 EMRO       EMRO          Afghanistan AFG             
#>  2 AFRO       AFRO-W        Algeria     DZA             
#>  3 AFRO       AFRO-W        Angola      AGO             
#>  4 PAHO       PAHO          Argentina   ARG             
#>  5 EURO       EURO          Armenia     ARM             
#>  6 EURO       EURO          Azerbaijan  AZE             
#>  7 SEARO      SEARO         Bangladesh  BGD             
#>  8 PAHO       PAHO          Belize      BLZ             
#>  9 AFRO       AFRO-C        Benin       BEN             
#> 10 SEARO      SEARO         Bhutan      BTN             
#> # … with 100 more rows
```

2.  `malaria_africa_ts` - containing malaria prevalence data, extracted
    using the `malariaAtlas` R package -
    <https://cran.r-project.org/web/packages/malariaAtlas/vignettes/overview.html>

``` r
malaria_africa_ts
#> # A tibble: 1,117 x 15
#>    who_region who_subregion country country_id continent_id  year month
#>    <chr>      <chr>         <chr>   <chr>      <chr>        <int> <int>
#>  1 AFRO       AFRO-W        Angola  AGO        Africa        1989     6
#>  2 AFRO       AFRO-W        Angola  AGO        Africa        2005    11
#>  3 AFRO       AFRO-W        Angola  AGO        Africa        2006     4
#>  4 AFRO       AFRO-W        Angola  AGO        Africa        2006    11
#>  5 AFRO       AFRO-W        Angola  AGO        Africa        2006    12
#>  6 AFRO       AFRO-W        Angola  AGO        Africa        2007     1
#>  7 AFRO       AFRO-W        Angola  AGO        Africa        2007     2
#>  8 AFRO       AFRO-W        Angola  AGO        Africa        2007     3
#>  9 AFRO       AFRO-W        Angola  AGO        Africa        2011     1
#> 10 AFRO       AFRO-W        Angola  AGO        Africa        2011     2
#> # … with 1,107 more rows, and 8 more variables: date <date>, lower_age <dbl>,
#> #   upper_age <int>, examined <int>, positive <dbl>, pr <dbl>, species <chr>,
#> #   method <chr>
```
