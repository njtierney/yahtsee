specials_fit_hts <- fabletools::new_specials(
  hts = function(keys = NULL) {
    # Your input handling code here.
    # this was previously (below) for SMEAN, season()
    # fabletools::get_frequencies(period = period,
    #                             self$data,
    #                             .auto = "smallest")
    # so now we need to get the names of the keys?
    tsibble::key(self$data)
  },
  # We can put other terms here if we like, which would be the default
  # other terms to add.
  # e.g., in the fabletools example it says,
  # SMEAN(y ~ season("year") + x)
  # becomes
  # SMEAN(y ~ season("year") + xreg(x))
  # But I'm not sure we need that, since
  # fit_hts(y ~ hts(x) + z)
  # should just stay that way.
  # This model requires `hts()`
  # Adding this allows `fit_hts(y)` to automatically include the `hts()` special
  .required_specials = "hts"
)
