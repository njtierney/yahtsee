#' Extract fitted values from `hts_inla` model object
#'
#' This returns the fitted
#'
#' @param object hts_inla object
#' @param exponentiate default FALSE
#' @param ... extra arguments. Currently not used.
#'
#' @export
#' @examples
#' head(fitted(hts_example_model))
fitted.hts_inla <- function(object,
                            exponentiate = FALSE,
                            ...){

  names <- rownames(object$summary.fitted.values)
  keep <- grepl("^fitted.APredictor", names)
  model_fit <- object$summary.fitted.values[keep, "mean"]

  if (exponentiate){
    return(exp(model_fit))
  }

  model_fit

}
