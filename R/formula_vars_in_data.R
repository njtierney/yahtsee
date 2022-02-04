#' Check if formula variables are present in data
#'
#' @param formula formula
#' @param data a `tsibble`
#' @export
#' @examples
#'
#' formula_vars_in_data(
#' data = malaria_africa_ts,
#' formula = pr ~ dates
#' )
#'

formula_vars_in_data <- function(data, formula){
  formula_vars <- all.vars(formula)

  data_vars <- names(data)

  formula_vars_in_data <- formula_vars %in% data_vars
  all_vars_in_data <- all(formula_vars_in_data)

  if (all_vars_in_data){
    return(TRUE)
  } else if (!all_vars_in_data){
    vars_in_data_index <- data_vars %in% formula_vars
    vars_in_data <- data_vars[vars_in_data_index]
    vars_not_in_data <- data_vars[!vars_in_data_index]
    msg <- cli::format_error(
      c(
        "Not all variables in the formula were present in the data",
        "i" = "Formula: {.formula {formula}}",
        "v" = "Variables in data: {.var {vars_in_data}}",
        "x" = "Variables not in data: {.var {formula_vars[!formula_vars_in_data]}}",
        "i" = "Double check the formula"
      )
    )
    rlang::abort(
      message = msg
    )
  }

}
