#' @title Create object of class "hts_model"
#' @param x model from inlabru
#' @return hts model
#' @author Nicholas Tierney
#' @note internal
as_hts_model <- function(x) {
  class(x) <- c("hts_model", x)
  x
}
