#' @title create formula to pass to inlabru::bru
#' @param formula formula with an hts() term
#' @param .data tsibble data
#' @param special_index special index term
#' @return formula
#' @author Nicholas Tierney
#' @export
#' @examples
#' bru_form <- build_bru_formula(
#'   formula = pr ~ avg_lower_age + hts(who_subregion, country),
#'   .data = malaria_africa_ts,
#'   special_index = month_num
#' )
#' bru_form
build_bru_formula <- function(formula, .data, special_index) {

  response <- rlang::f_lhs(formula)

  hts_terms <- extract_hts(formula)

  fixed_effects <- extract_fixed(formula)

  special_index <- rlang::enexpr(special_index)

  built_hts <- hts_builder(.data, new_index = !!special_index, !!!hts_terms)

  bru_formula <- rlang::new_formula(
    lhs = rlang::enexpr(response),
    rhs = rlang::expr(
      !!rlang::enexpr(fixed_effects) + !!rlang::enexpr(built_hts)
    )
  )

  bru_formula

}
