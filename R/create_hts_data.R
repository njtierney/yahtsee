#' Create data to be used when fitting a model with fit_hts
#'
#' @param .data tsibble
#' @param formula formula with hts() term
#'
#' @return data.frame
#' @export
#' @examples
#' data_w_groups <- create_hts_data(
#'   .data = malaria_africa_ts,
#'   formula = pr ~ avg_lower_age + hts(who_subregion, country)
#'   )
#' data_w_groups
create_hts_data <- function(.data, formula){

  hts_terms <- extract_hts(formula)

  data_groups <- purrr::map_dfc(
    .x = hts_terms,
    .f = generate_group_id,
    .data = .data
  )

  data_w_groups <- dplyr::bind_cols(
    .data,
    data_groups
  )

  data_w_groups

}
