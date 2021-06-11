empty_hts <- function(formula) {
  formula_string <- rlang::expr_text(formula)
  only_lr_paren <- stringr::str_detect(formula_string, "hts\\(\\)")
  space_inside_lr_paren <- stringr::str_detect(formula_string, "hts\\([\\s]\\)")

  only_lr_paren | space_inside_lr_paren
}
