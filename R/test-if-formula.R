test_if_formula <- function(x) {

  is_formula <- rlang::is_formula(x)
  if (!is.character(x)){
    is_one_sided <- formula.tools::is.one.sided(x)
  }

  if (!is_formula || is_one_sided) {
    msg <- cli::format_error(
      c(
        "Input must be a formula",
        x = "You've supplied an object of class {.cls {class(x)}}:",
        "{.var {x}}",
        "Formula should be specified with something on the left hand side of \\
        {.var ~} and the right hand side:",
        "e.g., {.var y ~ x + z}",
        "For more details on formula in R, see {.var ?formula}."
      )
    )
    rlang::abort(msg)
  }
}
