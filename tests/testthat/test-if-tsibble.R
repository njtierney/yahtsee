test_that("test_if_tsibble works", {
  expect_snapshot(
    error = TRUE,
    test_if_tsibble(iris)
  )
  expect_silent(
    test_if_tsibble(malaria_africa_ts)
  )
})
