contains_hts_call <- function(formula) {
  formula_string <- rlang::expr_text(formula)
  stringr::str_detect(formula_string, "hts\\([a-zA-Z]+")
}
