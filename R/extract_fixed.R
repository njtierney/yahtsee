extract_fixed <- function(formula) {

  formula_terms <- terms(formula, specials = "hts")
  which_hts <- attr(formula_terms, "specials")$hts
  which_response <- attr(formula_terms, "response")
  which_hts_response <- c(which_hts, which_response)
  fixed_terms <- rownames(attr(formula_terms, "factors"))[-which_hts_response]
  fixed_terms

}

