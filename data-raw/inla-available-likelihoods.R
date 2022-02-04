inla_available_likelihoods <- INLA::inla.models()$likelihood
use_data(inla_available_likelihoods,
         internal = TRUE)
