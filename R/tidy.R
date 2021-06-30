#' Tidy:  summarise a model's statistical findings
#'
#' The `tidy()` function provides a data frame of the mean, standard deviation,
#'   quantiles
#'
#' @param x object of class "hts_inla"
#'
#' @param ... extra arguments to pass to `tidy()`. Currently unused
#'
#' @return dataframe with column names: "variable", "mean", "sd", and quantiles for 0.025, 0.5, and 0.975, as well as mode and kld
#'
#' @export
#' @examples
#' hts_example_model
#' tidy(hts_example_model)
tidy.hts_inla <- function(x, ...){
  vars <- rownames(x$summary.fixed)
  df <- tibble::tibble(
    variable = vars,
    x$summary.fixed,
    .name_repair = "minimal"
    )
  setNames(
    object = df,
    nm = c(
      "variable",
      "mean",
      "sd",
      "q_025",
      "q_05",
      "q_975",
      "mode",
      "kld"
      )
  )
}
