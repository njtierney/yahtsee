warn_if_formula_not_hts <- function(formula){

  contains_hts <- contains_hts_call(formula)

  if (!contains_hts){
    msg <- cli::format_warning(
      c(
        "formula provided does not contain {.fun hts}",
        "Did you mean to include a {.fun hts} component in your model?",
        "e.g., {.var hts(country, region, continent)}"
      )
    )
    rlang::warn(msg)
  }

}
