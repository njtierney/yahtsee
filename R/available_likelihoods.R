#' Helper function to show the available likelihoods that can be used
#'
#' @return list of the available likelihoods
#' @export
#'
#' @examples
#' available_likelihoods()
available_likelihoods <- function(){
  INLA::inla.models()$likelihood
}
