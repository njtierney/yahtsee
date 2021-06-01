
# input must be a tsibble - provide clear advice to users on how to create one (which is
# the time/date column, which is the key?)
df_fit <- tsibble(...)

# function for fitting the model - note function to construct the herarchical
# time series bit - parse this and turn it into the inla formula
m <- fit(
  response ~ cov1 + cov2 +
    # inputs are  the levels of hierarchy, in order of decreasing size
    hts(who_region, who_subregion, country),
  data = df_fit,
  family = "empirical_logit",
  method = "inla-eb"
)

# m is an object with 'whatever' class

# class-specific functions for diagnostics (posterior predictive checks?) on model fit and visualisation
diagnostics(m)
plot(m)

# helper function to make prediction data (expand out to all cases)
df_pred <- prediction_data(
  df,
  date_range,
  countries
)

# post-hoc prediction function - with options for presenting the uncertainty
pred <- predict(m, df_pred, se.fit = TRUE)


