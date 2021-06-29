test_that("fit_hts fails without tsibble", {
  expect_snapshot_error(
    fit_hts(
      formula = pr ~ avg_lower_age + hts(who_subregion, country),
      .data = as_tibble(malaria_africa_ts),
      family = "gaussian",
      special_index = month_num
      )
  )
})

test_that("fit_hts fails without valid formula", {
  expect_snapshot_error(
    fit_hts(
      formula = "pr ~ avg_lower_age + hts(who_subregion, country)",
      .data = malaria_africa_ts,
      family = "gaussian",
      special_index = month_num
      )
  )
})

test_that("fit_hts fails when hts() not used", {
  expect_snapshot_error(
    fit_hts(
      formula = pr ~ avg_lower_age,
      .data = malaria_africa_ts,
      family = "gaussian",
      special_index = month_num
      )
  )
})

test_that("fit_hts fails when valid family not used", {
  expect_snapshot_error(
    fit_hts(
      formula = pr ~ avg_lower_age + hts(who_subregion, country),
      .data = malaria_africa_ts,
      family = "gas",
      special_index = month_num
    )
  )
})

test_that("fit_hts fails when family specified twice", {
  expect_snapshot_error(
    fit_hts(
      formula = pr ~ avg_lower_age + hts(who_subregion, country),
      .data = malaria_africa_ts,
      family = "gas",
      special_index = month_num,
      family = "gaussian"
    )
  )
})

test_that("fit_hts succeeds when using example code", {
  model <- fit_hts(
    formula = pr ~ avg_lower_age + hts(who_subregion, country),
    .data = malaria_africa_ts,
    family = "gaussian",
    special_index = month_num)

  expect_type(
    model,
    "list"
  )
})
