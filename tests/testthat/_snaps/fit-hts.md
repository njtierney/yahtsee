# fit_hts fails without tsibble

    Input must inherit from tsibble
    x You've supplied an object of class <tbl_df/tbl/data.frame>
    i See `?tsibble::as_tsibble()` for more information.

# fit_hts fails without valid formula

    Input must be a formula
    x You've supplied an object of class <character>:
    `pr ~ avg_lower_age + hts(who_subregion, country)`
    Formula should be specified with something on the left hand side of `~` and the
    right hand side:
    e.g., `y ~ x + z`
    For more details on formula in R, see `?formula`.

# fit_hts fails when hts() not used

    formula must contain `hts()` with arguments
    i correct = `fit_hts(y ~ x1 + x2 + hts(country, region, continent)`)
    x incorrect = `fit_hts(y ~ x1 + x2`)
    x incorrect = `fit_hts(y ~ x1 + x2 + hts()`)

# fit_hts fails when valid family not used

    Must provide valid likelihood family
    x You provided: 'gas'
    i Did you mean: 'gev' and 'gp'?
    i See `?INLA::inla.models()$likelihood` for all likelihoods

# fit_hts fails when family specified twice

    formal argument "family" matched by multiple actual arguments

