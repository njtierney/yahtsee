#' .. content for \description{} (no empty lines) ..
#'
extract_hts <- function(formula) {

  formula_string <- rlang::expr_text(formula)
  hts_string <- as.character(stringr::str_extract_all(
    string = formula_string,
    pattern = "hts(?:\\()[^\\(\\)]*?(?:\\))"
    ))
  rlang::parse_expr(hts_string)

}
