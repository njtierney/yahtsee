#' Predict from hts_inla model
#'
#' @param object a fitted object of class inheriting from `hts_model`
#' @param newdata optionally, a data frame in which to look for variables with
#'    which to predict.  If omitted, the fitted linear predictors are used.
#' @param type the type of prediction required.  The default is on the scale of
#'     the linear predictors; the alternative ‘"response"’ is on the scale of
#'     the response variable.  Thus for a default binomial model the default
#'     predictions are of log-odds (probabilities on logit scale) and
#'     ‘type = "response"’ gives the predicted probabilities.  The ‘"terms"’
#'     option returns a matrix giving the fitted values of each term in the
#'     model formula on the linear predictor scale. The value of this argument
#'     can be abbreviated.
#' @param se.fit logical switch indicating if standard errors are required.
#' @param dispersion the dispersion of the GLM fit to be assumed in computing
#'     the standard errors.  If omitted, that returned by ‘summary’ applied to
#'     the object is used.
#' @param terms with ‘type = "terms"’ by default all terms are returned.  A
#'     character vector specifies which terms are to be returned
#' @param na.action function determining what should be done with missing
#'     values in ‘newdata’.  The default is to predict ‘NA’.
#' @param ...further arguments passed to or from other methods.
#' @return
#' @note currently borrowing parameters + descriptions from predict.glm
#'
#' @examples
#' \dontrun{
#' predict(hts_example_model)
#' }
predict.hts_inla <- function(object,
                             newdata = NULL,
                             type = c("link", "response", "terms"),
                             se.fit = FALSE,
                             dispersion = NULL,
                             terms = NULL,
                             na.action = na.pass,
                             # I don't think we want to use the inlabru method?
                             # formula = NULL,
                             # n.samples = 100,
                             # seed = 0L,
                             # num.threads = NULL,
                             # include = NULL,
                             # exclude = NULL,
                             # drop = FALSE,
                             ...) {

  predict(object,
          newdata,
          ...)

}
