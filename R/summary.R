#' @export
summary.hts_inla <- function(object, ...){
  time <- round(object$cpu.used[["Total"]], 2)
  cli::cli({
    cli::cat_line(
      "<", class(object)[1], "> model (fit in ", time, "s)", col = "orange")
    cli::cat_line("Formula:")
    cli::cat_bullet(object$formula)
    cli::cat_line("Response:")
    cli::cat_bullet(object$hts_response)
    cli::cat_line("Random Effects:")
    cli::cat_bullet(object$hts_terms)
    cli::cat_line("Fixed Effects:")
    cli::cat_bullet(object$names.fixed)
    cli::cat_line("Family: ", object$.args$family)
  })
}
