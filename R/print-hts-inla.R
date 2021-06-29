cat_line <- function (...) {
  cat(paste0(..., "\n", collapse = ""))
}

print.hts_inla <- function(x, ...){
  cat_line("<", class(x)[1], ">")
}
