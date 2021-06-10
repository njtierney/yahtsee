#' @title
#' @param formula
#' @return
#' @author Nicholas Tierney
#' @export
contains_hts_call <- function(formula) {

  formula_string <- deparse(formula)
  stringr::str_detect(formula_string, "hts\\([a-zA-Z]+")

}
