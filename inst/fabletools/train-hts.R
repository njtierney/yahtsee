train_hts <- function(.data, specials, ...) {
  # Extract a vector of response data
  mv <- tsibble::measured_vars(.data)
  index <- tsibble::index(.data)
  y <- .data[[mv]]

  # Pull out inputs from the specials
  if (length(specials$hts) > 1) {
    stop("The `hts()` special of `fit_hts()` should only be used once.")
  }
  # m <- specials$hts[[1]]
  hts_inputs <- specials$hts

  # instead of computing the seasonal averages, this is where we would
  # transform the input of `hts()` into the inlabru::bru equivalent?

  # Compute the seasonal averages
  season_id <- seq(0, length(y) - 1) %% m
  season_y <- split(y, season_id)
  season_avg <- vapply(season_y,
    FUN = mean, FUN.VALUE = numeric(1L),
    USE.NAMES = FALSE
  )

  # Compute fitted values and residuals
  fit <- season_avg[season_id + 1]
  e <- y - fit

  # Create S3 model object
  # It should be small, but contain everything needed for methods below
  structure(
    list(
      coef = season_avg,
      n = length(y),
      y_name = mv,
      fitted = fit,
      residuals = e
    ),
    class = "model_fit_hts"
  )
}
