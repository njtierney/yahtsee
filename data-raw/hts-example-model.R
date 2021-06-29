## code to prepare `hts-example-model` dataset goes here
library(yahtsee)
hts_example_model <- fit_hts(
  #inputs are  the levels of hierarchy, in order of decreasing size
  formula = pr ~ avg_lower_age + hts(who_subregion, country),
  .data = malaria_africa_ts,
  family = "gaussian",
  special_index = month_num
)

new_example_model <- list()

new_example_model$formula <- hts_example_model$formula
new_example_model$hts_response <- hts_example_model$hts_response
new_example_model$hts_terms <- hts_example_model$hts_terms
new_example_model$names.fixed <- hts_example_model$names.fixed
new_example_model$.args$family <- hts_example_model$.args$family
new_example_model$summary.fixed <- hts_example_model$summary.fixed
new_example_model$summary.linear.predictor <- hts_example_model$summary.linear.predictor
new_example_model$summary.fitted.values <- hts_example_model$summary.fitted.values

hts_example_model <- yahtsee:::as_hts_inla(
  new_example_model,
  pr ~ avg_lower_age + hts(who_subregion, country)
  )

usethis::use_data(hts_example_model, overwrite = TRUE, compress = "xz")
