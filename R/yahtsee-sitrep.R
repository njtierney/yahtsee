#' Checks if system requirements are present
#'
#' Currently this just checks for INLA
#'
#' @return message on availability of system requirements
#' @export
#' @examples
#' \dontrun{
#' yahtsee_sitrep()
#' }
yahtsee_sitrep <- function(){

  cli::cli_process_start("checking if {.pkg INLA} available")
  if (!have_inla()) {
    cli::cli_process_failed(msg_failed = "{.pkg INLA} not available")
    cli::cli_alert(
      text = "{.pkg INLA} is not available, you can install it \\
      by running the helper function:
      {.code install_yahtsee_deps()}
      or by running:
      {.code install.packages('INLA', repos = 'https://inla.r-inla-download.org/R/testing')}"
    )
  } else{
    pkgversion <- packageVersion("INLA")
    cli::cli_process_done(
      msg_done = "{.pkg INLA} version {.version {pkgversion}} available"
    )
  }
}

