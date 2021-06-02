#' Fitted Hierarchical Time Series
#'
#' Typically this includes a "Specials" section
#'
#' @export
fit_hts <- function(formula, ...) {
  # Create a model class which combines the training method, specials, and data checks
  model_hts <- fabletools::new_model_class(
    model = "hts",
    # The training method (more on this later)
    train = train_hts,
    # The formula specials (the next section)
    specials = specials_hts,
    # Any checks of the unprocessed data, like gaps, ordered, regular, etc.
    check = function(.data) {
      if (!tsibble::is_regular(.data)) warning("Data must be regular")
      }
  )

  # Return a model definition which stores the user's model specification
  fabletools::new_model_definition(.class = model_hts,
                                   formula = {{formula}},
                                   ...)
}
