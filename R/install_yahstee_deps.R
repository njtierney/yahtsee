#' Install yahtsee dependencies
#'
#' Currently this just installs the latest version of INLA
#'
#' @return nothing
#' @export
#'
#' @examples
#' \dontrun{
#' install_yahtsee_deps()
#' }
install_yahtsee_deps <- function(){

  cli::cli_process_start("installing INLA")
  utils::install.packages(
    pkgs =  "INLA",
    repos = "https://inla.r-inla-download.org/R/testing"
    )
  cli::cli_process_done()

}
