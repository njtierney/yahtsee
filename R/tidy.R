#' @export
tidy.hts_inla <- function(x, ...){
  vars <- rownames(x$summary.fixed)
  df <- tibble::tibble(
    variable = vars,
    x$summary.fixed,
    .name_repair = "minimal"
    )
  df
}
