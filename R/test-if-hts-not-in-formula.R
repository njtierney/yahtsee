test_if_hts_not_in_formula <- function(formula) {
  contains_hts <- contains_hts_call(formula)

  hts_is_empty <- empty_hts(formula)

  if (hts_is_empty) {
    msg <- cli::format_error(
      c(
        "{.fun hts} must contain arguments",
        i = "correct = {.var  fit_hts(y ~ x1 + x2 + hts(country, region, \\
        continent)})",
        x = "incorrect = {.var  y ~ x1 + x2 + hts()}"
      )
    )
    rlang::abort(msg)
  }

  if (!contains_hts) {
    msg <- cli::format_error(
      c(
        "formula must contain {.fun hts} with arguments",
        i = "correct = {.var  fit_hts(y ~ x1 + x2 + hts(country, region, \\
        continent)})",
        x = "incorrect = {.var  fit_hts(y ~ x1 + x2})",
        x = "incorrect = {.var  fit_hts(y ~ x1 + x2 + hts()})"
      )
    )
    rlang::abort(msg)
  }
}
