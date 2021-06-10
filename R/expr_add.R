expr_add <- function(x) {
  purrr::reduce(
    .x = x,
    .f = ~ rlang::expr(!!.x + !!.y)
  )
}
