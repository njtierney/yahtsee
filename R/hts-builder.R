#' Build hts call
#'
#' @param .data tsibble
#' @param ... the levels of hierarchy, in order of decreasing size
#'
#' @return list of expressions to pass into INLA
#' @export
#'
#' @examples
#'
#' hts_builder(malaria_africa_ts, who_region, who_subregion, country)
#'
#' hts_builder(malaria_africa_ts, who_region, who_subregion, country) %>%
#'   paste0(collapse = " + ") %>%
#'   rlang::sym()
#'
hts_builder <- function(.data, ...){
  dots <- rlang::ensyms(...)
  data_index <- tsibble::index(.data)

  f_generator <- function(group){
    f_expr <- rlang::expr(
      f(
        !!data_index,
        model = "ar1",
        group = !!group,
        constr = FALSE
      )
    )
    f_expr[[1]] <- rlang::expr(!!group)
    f_expr
  }

  purrr::map(.x = dots,
             .f = f_generator)

}
