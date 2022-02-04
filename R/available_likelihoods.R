#' Helper function to show the available likelihoods that can be used
#'
#' @return list of the available likelihoods
#' @export
#'
#' @examples
#' available_likelihoods()
#' # code taken from INLA::inla.models()$likelihood
available_likelihoods <- function(){
  inla_available_likelihoods
}
