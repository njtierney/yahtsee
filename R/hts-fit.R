#' Fit a hierarchical time series model
#'
#' @param formula formula must contain fixed effect terms and `hts()`
#' @param .data a `tsibble`
#' @param special_index The variable that represents time in your data
#' @param family character.
#' @param ... list of options to pass to `inlabru::bru`, see `?inlabru::bru`
#'     to see these options.
#' @return inlabru model
#'
#' @details
#'
#'  # How to allow weighting of observations?
#'
#'  To weight your observations, say when using empirical logit, you must
#'  provide a vector of variances, for each observation, which represents
#'  the uncertainty of measurement. You can do this, provided the
#'  `family = "gaussian"`, add the argument, `scale = vec`, to `fit_hts`,
#'  where `vec` is a vector of variances for each observation.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' m <- fit_hts(
#' #inputs are  the levels of hierarchy, in order of decreasing size
#' formula = pr ~ avg_lower_age + hts(who_subregion, country),
#' .data = malaria_africa_ts,
#' family = "gaussian",
#' special_index = month_num
#' )
#' }
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
  # test_options_valid(dots)

  special_index <- rlang::enexpr(special_index)

  bru_formula <- build_bru_formula(formula, .data, !!special_index)

  # add groups to the data
  data_w_groups <- create_hts_data(.data, formula)

  cli::cli_process_start("Fitting model with inlabru")
  bru_model <- inlabru::bru(
    bru_formula,
    family = family,
    data = data_w_groups,
    options = list(
      !!!dots
    )
  )
  cli::cli_process_done()

  bru_model
}
