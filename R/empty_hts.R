#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param formula
#' @return
#' @author Nicholas Tierney
#' @export
empty_hts <- function(formula) {

  formula_string <- deparse(formula)
  only_lr_paren <- stringr::str_detect(formula_string, "hts\\(\\)")
  space_inside_lr_paren <- stringr::str_detect(formula_string, "hts\\([\\s]\\)")

  only_lr_paren | space_inside_lr_paren

}
