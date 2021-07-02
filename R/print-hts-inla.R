#' @export
print.hts_inla <- function(x, ...){

  cli::cli({
    cli::cat_line(
      "<", class(x)[1], "> model (fit in ", round(x$cpu.used[["Total"]], 2), "s)",
      col = "orange")
    cli::cat_line("Formula:")
    cli::cat_bullet(x$formula)
  })
}
