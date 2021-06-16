#' @title Create object of class "hts_inla"
#' @param x model from inlabru
#' @return hts_inla model
#' @author Nicholas Tierney
#' @note internal
as_hts_inla <- function(x) {
  class(x) <- c("hts_inla", class(x))
  x
}
