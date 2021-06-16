test_that("test_if_hts_not_in_formula errors appropriately", {
  expect_snapshot(
    error = TRUE,
    test_if_hts_not_in_formula(y ~ x)
  )
  expect_snapshot(
    error = TRUE,
    test_if_hts_not_in_formula(y ~ x + hts())
  )
  expect_silent(
    test_if_hts_not_in_formula(y ~ x + hts(country))
  )

})
