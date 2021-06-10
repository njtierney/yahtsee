extract_hts <- function(formula) {
  formula_terms <- stats::terms(formula, specials = "hts")
  which_hts <- attr(formula_terms, "specials")$hts
  which_response <- attr(formula_terms, "response")
  hts_terms <- rownames(attr(formula_terms, "factors"))[which_hts]
  hts_terms

  hts_expr <- rlang::parse_expr(hts_terms)
  hts_list <- as.list(hts_expr)
  hts_list[[1]] <- NULL
  hts_list
}
