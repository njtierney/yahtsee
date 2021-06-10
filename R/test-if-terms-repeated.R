#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param formula
#' @return
#' @author Nicholas Tierney
#' @export
test_if_terms_repeated <- function(formula) {

  response <- formula[[2]]
  fixed_effects <- extract_fixed(formula)
  hts_terms <- extract_hts(formula)

  response_in_fixed <- response %in% fixed_effects
  response_in_hts <- response %in% hts_terms
  fixed_in_hts <- fixed_effects %in% hts_terms

  if (response_in_fixed) {
    msg <- cli::format_error(
      c(
        "Response term must only be used as response",

      )
    )
  }


}
