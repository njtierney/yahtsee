test_if_tsibble <- function(x){
  if (!inherits(x, "tbl_ts")) {

    msg <- cli::format_error(
      c(
        "Input must inherit from tsibble",
        x = "You've supplied an object of class {.cls {class(x)}}",
        i = "See {.var ?tsibble::as_tsibble()} for more information."
        )
    )

    rlang::abort(msg)
  }
}
