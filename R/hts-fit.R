fit_hts <- function(formula,
                    .data,
                    family,
                    ...){

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

  built_hts <- hts_builder(.data, !!!hts_terms)

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
  bru_formula <- !!response ~ !!fixed_effects + Intercept + !!built_hts

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

  as_hts_model(bru_model)

}
