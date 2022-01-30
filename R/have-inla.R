have_inla <- function(){
  x <- requireNamespace("INLA", quietly = TRUE)
  x
}
