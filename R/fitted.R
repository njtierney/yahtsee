#' Extract fitted values from model object
#'
#' @param object hts_inla object
#' @param fit default is "mean". Options are: "mean", "sd", "0.025quant", "0.5quant", "0.975quant", and "mode".
#' @param exponentiate default FALSE
#' @param ... extra arguments. Currently not used
#'
#' @export
fitted.hts_inla <- function(object,
                            fit = "mean",
                            exponentiate = FALSE,
                            ...){

  model_fit <- object$summary.fitted.values[[fit]]

  if (exponentiate){
    return(exp(model_fit))
  }

  model_fit
}
