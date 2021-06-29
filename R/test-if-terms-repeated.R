test_if_terms_repeated <- function(formula) {

  flatten_sym_chr <- function(x){
    purrr::map_chr(x, ~unlist(rlang::as_string(.x)))
  }

  response <- rlang::f_lhs(formula) %>% rlang::as_string()
  fixed_effects <- extract_fixed(formula) %>% rlang::as_string()


  if (contains_hts_call(formula)) {
    hts_terms <- extract_hts(formula) %>% flatten_sym_chr()
    fixed_in_hts <- fixed_effects %in% hts_terms
    response_in_hts <- response %in% hts_terms

    if (fixed_in_hts) {
      msg <- cli::format_error(
        c(
          "Fixed term must only be used in fixed effects, not in {.fun hts}",
          "{.var {formula}}",
          "A fixed term was used inside the {.fun hts} call",
          "x" = "y ~ x + hts({.strong x})",
          "v" = "y ~ x + hts(z)"
        )
      )

      rlang::abort(msg)
    }

    if (response_in_hts) {
      msg <- cli::format_error(
        c(
          "Response term must only be used as response",
          "{.var {formula}}",
          "The response {.var {response}} was used on the right hand side of the \\
        formula in the {.fun hts} component. The response should only be on \\
        the left hand side of the formula.",
        "x" = "y ~ x + hts({.strong y})",
        "v" = "y ~ x + hts(z)"
        )
      )
      rlang::abort(msg)
    }

  }

  lhs <- rlang::f_rhs(formula)
  if (length(lhs) == 1){
    bare_rhs <- rlang::as_string(lhs)
  } else {
    bare_rhs <- stats::terms(lhs)
  }

  response_in_fixed <- response %in% bare_rhs

  if (response_in_fixed) {
    msg <- cli::format_error(
      c(
        "Response term must only be used as response",
        "{.var {formula}}",
        "The response {.var {response}} was used on the right hand side of the \\
        formula in the fixed effects. The response should only be on the left \\
        hand side of the formula, and not be repeated.",
        "x" = "y ~ hts(x) + {.strong y}",
        "v" = "y ~ hts(x)"
      )
    )
    rlang::abort(msg)
  }


}
