fit_hts <- function(formula,
                    .data,
                    family,
                    ...){

  test_if_tsibble(.data)
  test_if_formula(formula)
  test_if_hts_not_in_formula(formula)
  test_if_valid_family(family)
  test_if_terms_repeated(formula)
  test_dots_valid(...)

  captured_formula <- rlang::enquo(formula)

  response <- captured_formula[[2]]

  fixed_effects <- extract_fixed(captured_formula)

  hts_terms <- extract_hts(captured_formula)

  built_hts <- hts_builder(.data, hts_terms)

  parsed_hts <- parse_hts(built_hts)

  # add groups to the data
  data_w_groups <- .data %>%
    purrr::map_df(!!!extracted_hts, add_group_id)

  bru_model <- inlabru::bru(
    # need a way to help users add an intercept or not?
    !!response ~ !!fixed_effects + Intercept + !!!parsed_hts,
    family = family,
    data = data_w_groups,
    options = list(
      control.compute = list(config = TRUE),
      control.predictor = list(compute = TRUE, link = 1),
      ...
    )
  )

  as_hts_model(bru_model)

}
