#' @export
print.hts_inla <- function(x, ...){

  cli::cli({
    cli::cat_line("<", class(x)[1], "> model", col = "orange")
    cli::cat_line("Formula:")
    cli::cat_bullet(x$formula)
    cli::cat_line("Response:")
    cli::cat_bullet(x$hts_response)
    cli::cat_line("Random Effects:")
    cli::cat_bullet(x$hts_terms)
    cli::cat_line("Fixed Effects:")
    cli::cat_bullet(x$names.fixed)
    cli::cat_line("Family: ", x$.args$family)
  })
}
