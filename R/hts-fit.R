#' Fit a hierarchical time series model
#'
#' @param formula formula must contain fixed effect terms and `hts()`
#' @param .data a `tsibble`
#' @param special_index The variable that represents time in your data
#' @param family character
#' @param ... extra arguments to pass to inlabru
#'
#' @return inlabru model
#' @export
#'
#' @examples
#' m <- fit_hts(
#' inputs are  the levels of hierarchy, in order of decreasing size
#' formula = pr ~ avg_lower_age + hts(who_subregion, country),
#' .data = malaria_africa_ts,
#' family = "gaussian",
#' special_index = month_num
#' )
fit_hts <- function(formula,
                    .data,
                    special_index,
                    family,
                    ...) {
  test_if_tsibble(.data)
  test_if_formula(formula)
  test_if_hts_not_in_formula(formula)
  test_if_valid_family(family)
  dots <- rlang::dots_list(..., .homonyms = "error")
  # test_if_terms_repeated(formula)
  # test_dots_valid(dots)

  response <- rlang::f_lhs(formula)

  hts_terms <- extract_hts(formula)

  fixed_effects <- extract_fixed(formula)

  special_index <- rlang::enexpr(special_index)

  built_hts <- hts_builder(.data, new_index = !!special_index, !!!hts_terms)

  # add groups to the data
  data_groups <- purrr::map_dfc(
    .x = hts_terms,
    .f = generate_group_id,
    .data = .data
  )

  data_w_groups <- dplyr::bind_cols(
    .data,
    data_groups
  )

  # need a way to help users add an intercept or not?
  bru_formula <- rlang::new_formula(
    lhs = rlang::enexpr(response),
    rhs = rlang::expr(
      !!rlang::enexpr(fixed_effects) + !!rlang::expr(Intercept) + !!rlang::enexpr(built_hts)
    )
  )

  cli::cli_process_start("Fitting model with inlabru")
  bru_model <- inlabru::bru(
    bru_formula,
    family = family,
    data = data_w_groups,
    options = list(
      control.compute = list(config = TRUE),
      control.predictor = list(compute = TRUE, link = 1),
      !!!dots
    )
  )
  cli::cli_process_done()

  bru_model
}
