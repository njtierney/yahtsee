#' Create prediction data
#'
#' Create prediction data that has the same index and key as the model data
#'   for use in prediction.
#'
#' @param model_data data used in the model
#' @param key new key
#' @param index new index
#' @param ... any other variables you want to create an example dataset of
#'
#' @return `tsibble` object with the same index and key as `model_data`.
#' @export
#'
#' @examples
#' date_range <- clock::date_build(2019, 2, 1:5)
#' date_range
#' countries <- c("Ethiopia", "Tanzania")
#' countries
#' prediction_data(
#'   model_data = malaria_africa_ts,
#'   key = countries,
#'   index = date_range
#'  )
prediction_data <- function(model_data, key, index, ...){
  df_cross <- tidyr::crossing(
    {{ key }},
    {{ index }},
    ...
  )

  # check that the key and index match the tsibble
  og_key <- tsibble::key_vars(model_data)
  og_index <- tsibble::index_var(model_data)


  prediction_data <- df_cross %>%
    tsibble::as_tsibble(
      key = {{ key }},
      index = {{ index }}
      ) %>%
    dplyr::rename(!!og_key := {{ key }},
                  !!og_index := {{ index }})

  prediction_data

}
