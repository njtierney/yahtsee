#' Glance: A single row summary of a model fit
#'
#' @param x object of class "hts_inla"
#'
#' @param ... extra arguments to pass to `glance()`. Currently unused
#'
#' @return dataframe with column names: deviance information criterion, wakaike information criteriot, log marginal-likelihood (integration), log marginal-likelihood (Gaussian).
#'
#' @export
#' @examples
#' hts_example_model
#' glance(hts_example_model)
glance.hts_inla <- function(x, ...){
  tibble::tibble(
    dic = x$dic$dic,
    waic = x$waic$waic,
    mlik_integration = x$mlik[1],
    mlik_gaussian = x$mlik[2]
  )
}
