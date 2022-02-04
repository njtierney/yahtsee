#' augment: Add predictions and residuals to data
#'
#' The `augment()` function returns the data used in the model
#'
#' @param x object of class "hts_inla"
#' @param newdata new data to pass to prediction? Default is NULL
#' @param exponentiate default FALSE. Whether to exponentiate predictions
#' @param ... extra arguments to pass to `augment()`. Currently unused.
#'
#' @return dataframe with column names of original data, as well as extra columns,  ".fitted" and ".resid".
#'
#' @export
#' @examples
#' hts_example_model
#' augment(hts_example_model)
augment.hts_inla <- function(x,
                             newdata = NULL,
                             exponentiate = FALSE,
                             ...){

  passed_newdata <- !is.null(newdata)

  if (passed_newdata) {
    x$data$.fitted <- predict(x,
                            data = newdata,
                            ...) %>%
        unname()

  # some options for exponentiation?
  } else {
    x$data$.fitted <- fitted(x, exponentiate = exponentiate)
  }

  response_var <- x$data[[rlang::f_lhs(x$formula)]]

  x$data$.resid <- (response_var - x$data$.fitted) %>% unname()

  x$data



}
