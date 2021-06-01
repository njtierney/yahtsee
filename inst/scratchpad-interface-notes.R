# goals for next meeting
# get the fake data sorted
# demonstrate the tsibble interface
# get the UI working
# workflow
# e.g., predictions, adding plots.

res.detrend.regions.bymsp <- inla(
  resid.m1 ~ 0 + is_act  + trtseek.d + popurban.d + anc1cov.d + oopfrac.d +
  hcaccess.d + eduallagsx.d + sbacov.d + haqi.d + actyears20.d + logthepc.d +
      # user is providing this ^^ for fixed effects
      # hts(whoregion, whosubregion, country)
      # so we want a random intercept for country, varying for year
      # the data frame is a tsibble, which knows which ting is year
      # fixed effects of subregion
    country.year.whosubregion.afro.c.cov + country.year.whosubregion.afro.e.cov +
    country.year.whosubregion.afro.s.cov + country.year.whosubregion.afro.w.cov +
    country.year.whosubregion.emro.cov + country.year.whosubregion.euro.cov +
    country.year.whosubregion.paho.cov + country.year.whosubregion.searo.cov +
    country.year.whosubregion.wpro.cov +
      # these lines ^^ could most likely be replaced by `factor(who_subregion)`
      # this information is taken from the `hts` call
      # random intercept by country
      f(country.year.country.idsp1,
        # check about weights
        # year weights
        country.year.year.idsp1,
        model = "iid") +
      # year fixed effect - taken from the tsibble
      country.year.year.idsp1 +

      # these lines onwards are the hierarchical time series effects
      # AR1 process for year, by each of the groups in `hts()`
      # country, region, subregion
      f(
        # this is just "year"
        country.year.year.idx,
        model = "ar1",
        # this is fitting a wiggly line for each country
        group = country.year.country.id,
        constr = FALSE
      ) +
      f(
        country.year.year.idy,
        model = "ar1",
        # this is fitting a wiggly line for each subregion
        group = country.year.whosubregion.id,
        constr = FALSE
      ) +
      f(
        country.year.year.idz,
        model = "ar1",
        group = country.year.whoregion.id,
        constr = FALSE
      ),
    data = data,

    # We don't need these quantile bits, we can put this into the
    # predict method.
    quantiles = c(0.025, 0.25, 0.5, 0.75, 0.975),

    # scale is specific to the family used. In this case the default is
    # "gaussian", and this scale argument is for that family.
    scale = emplogitactvar,
    # these parts here are INLA-specific
    control.inla = list(int.strategy = "eb"),

    # these should always be on for INLA, they allow you to get the options back
    control.compute = list(config = TRUE),
    control.predictor = list(compute = TRUE)
  )


