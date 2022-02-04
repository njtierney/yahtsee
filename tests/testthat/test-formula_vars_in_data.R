
test_that("formula_vars_in_data works", {
  expect_snapshot(error = TRUE,
    formula_vars_in_data(data = malaria_africa_ts,
                         formula = pr ~ dates)
  )
  expect_snapshot_error(
    formula_vars_in_data(data = malaria_africa_ts,
                         formula = pr ~ month_nums)
  )
  expect_true(
    formula_vars_in_data(data = malaria_africa_ts,
                         formula = pr ~ month_num)
  )
  expect_true(
    formula_vars_in_data(data = malaria_africa_ts,
                         formula = pr ~ avg_lower_age + hts(who_region, who_subregion, country))
  )
})

