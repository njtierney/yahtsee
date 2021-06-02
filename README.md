
<!-- README.md is generated from README.Rmd. Please edit that file -->

# malariahts

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/malariahts)](https://CRAN.R-project.org/package=malariahts)
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

This is a basic example which shows you how to solve a common problem:

``` r
library(malariahts)
## basic example code
```
