#' Build hts call
#'
#' @param .data tsibble
#' @param new_index (temporary) new index we are using whilr working out
#'   model kinks
#' @param ... the levels of hierarchy, in order of decreasing size
#'
#' @return constructed expression of ar1 terms to pass to inla
#' @export
#'
#' @examples
#'
# # hts_builder(malaria_africa_ts, who_region, who_subregion, country)
#'
hts_builder <- function(.data, new_index, ...){
  dots <- rlang::ensyms(...)
  new_index <- rlang::enexpr(new_index)
  # data_index <- tsibble::index(.data)

  random_effect_ar1_generator <- function(group){

    group_name <- rlang::enexpr(group)
    new_name <- glue::glue(".{rlang::expr_text(group_name)}_id")
    new_group_sym <- rlang::sym(new_name)

    f_expr <- rlang::expr(
      f(
        # !!data_index,
        !!new_index,
        model = "ar1",
        group = !!new_group_sym,
        constr = FALSE
      )
    )
    f_expr[[1]] <- rlang::expr(!!group)
    f_expr
  }

  hts_terms <- purrr::map(
    .x = dots,
    .f = random_effect_ar1_generator
    )

  expr_add(hts_terms)

}
