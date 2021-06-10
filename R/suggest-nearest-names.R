suggest_nearest_likelihood_names <- function(x) {

  # shamelessly taken from https://gist.github.com/goldingn/80c82f2886debeb927a5
  # no-frills fuzzy matching of strings between character vectors
  # `a` and `b` (essentially a wrapper around a stringdist function)
  # The function returns a two column matrix giving the matching index
  # (as `match` would return) and a matrix giving the distances, so you
  # can check how well it did on the hardest words.
  # Warning - this uses all of your cores.

  # calculate a jaccard dissimilarity matrix
  distance <- stringdist::stringdist(
    x,
    inla_likelihood_names
  )
  # find the closest match for each
  inla_likelihood_names[min(distance) == distance]
}
