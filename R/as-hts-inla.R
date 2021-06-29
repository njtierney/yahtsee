#' @title Create object of class "hts_inla"
#'
#' @param x model from inlabru
#' @param formula formula passed to `fit_hts()`
#'
#' @return hts_inla model
#' @author Nicholas Tierney
#' @note internal
as_hts_inla <- function(x, formula) {
  x$hts_response <- rlang::f_lhs(formula)
  x$hts_terms <- extract_hts(formula)
  x$formula <- formula
  class(x) <- c("hts_inla", class(x))
  x
}
