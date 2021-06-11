
<!-- README.md is generated from README.Rmd. Please edit that file -->

# yahtsee

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/yahtsee)](https://CRAN.R-project.org/package=yahtsee)
[![R-CMD-check](https://github.com/njtierney/yahtsee/workflows/R-CMD-check/badge.svg)](https://github.com/njtierney/yahtsee/actions)
[![Codecov test
coverage](https://codecov.io/gh/njtierney/yahtsee/branch/main/graph/badge.svg)](https://codecov.io/gh/njtierney/yahtsee?branch=main)
<!-- badges: end -->

The goal of yahtsee is to provide tools around fitting hierarchical time
series models for data commonly found in malaria.

## Installation

You can install the released version of yahtsee from GitHub with:

``` r
# install.packages("remotes")
remotes::install_github("njtierney/yahtsee")
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

## Example model

``` r
m <- fit_hts(
    # inputs are  the levels of hierarchy, in order of decreasing size
  formula = pr ~ avg_lower_age + hts(who_region, who_subregion, country),
  .data = malaria_africa_ts,
  family = "gaussian",
  special_index = month_num
)
```

This is a model with an AR1 process for each of these subregions using
the `hts()` component in the formula. The inputs are the levels of
hierarchy, in order of decreasing size.

We then provide the data, likelihood family (in this case “gaussian”,
but all INLA likelihoods are available).

We specify the time component at the moment using the `special_index`
argument (this will be removed later once we resolve a couple of bugs to
do with the data).

The equivalent model fitted with `inlabru` would look like the
following:

``` r
inlabru::bru(
formula = pr ~ avg_lower_age + Intercept + 
  who_region(month_num, 
             model = "ar1", 
             group = .who_region_id,
             constr = FALSE) + 
  who_subregion(month_num, 
                model = "ar1", 
                group = .who_subregion_id, 
                constr = FALSE) + 
  country(month_num, 
          model = "ar1", 
          group = .country_id, 
          constr = FALSE),
    family = "gaussian",
    data = malaria_africa_ts,
    options = list(
      control.compute = list(config = TRUE),
      control.predictor = list(compute = TRUE, link = 1)
      )
      )
```

Using `yahtsee`’s `fit_hts` function, we now do not need to think about
the following:

1.  What to name the random effects (who\_region, who\_subregion,
    country)
2.  Specifying the time component of the ar1 process (`month_num`)
3.  repeating the “ar1” component for each random effect
4.  The `group` argument requires a special index variable of a group to
    be made (`.who_subregion_id`)
5.  Additional options passed to `inlabru` in options to help get the
    appropriate data back.

## Motivation

This package was built to help make is simpler to create specific type
of hierarchical time series models, for modelling packages like `INLA`,
`inlabru`, and `mgcv`.

Specifically we had the following goals:

-   Specify hierarchical time series random effects with a formula
    interface, similar to `gam` and other modelling software.
-   Handle as many data processing steps specific to model software as
    possible, so users can focus on creating the model rather than doing
    complex data wrangling steps to set up dummy variables.
-   Use `tsibble` data structure to store the `time` component of the
    time series so the model is aware of the time component and it
    doesn’t need to be specified
-   Provide methods for model interrogation and diagnostics, e.g.,
    -   visualising model outputs
    -   predictions, residuals, partial predictive plots
    -   posterior predictive checks
    -   post-hoc prediction

## Example data

``` r
library(yahtsee)
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
