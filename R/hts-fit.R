fit_hts <- function(formula,
                    .data,
                    family,
                    ...){

  captured_formula <- rlang::enquo(formula)

  f_response <- captured_formula[[2]]

  f_fixed <- extract_fixed(captured_formula)

  extracted_hts <- extract_hts(captured_formula)

  built_hts <- hts_builder(.data, extracted_hts)

  parsed_hts <- parse_hts(built_hts)

  # add groups to the data
  data_w_groups <- .data %>%
    map_df(!!!extracted_hts, add_group_id)

  bru_model <- inlabru::bru(
    # need a way to help users add an intercept or not?
    !!f_response ~ !!f_fixed + Intercept + !!!parsed_hts,
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
