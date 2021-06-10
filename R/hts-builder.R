#' Build hts call
#'
#' @param .data tsibble
#' @param ... the levels of hierarchy, in order of decreasing size
#'
#' @return constructed expression of ar1 terms to pass to inla
#' @export
#'
#' @examples
#'
#' hts_builder(malaria_africa_ts, who_region, who_subregion, country)
#'
hts_builder <- function(.data, ...){
  dots <- rlang::ensyms(...)
  data_index <- tsibble::index(.data)

  f_generator <- function(group){
    # need to add "." to the group name followed by _id
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

  hts_terms <- purrr::map(
    .x = dots,
    .f = f_generator
    )

  purrr::reduce(
    .x = hts_terms,
    .f = ~ rlang::expr(!!.x + !!.y)
    )

}
