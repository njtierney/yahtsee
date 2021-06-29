test_that("test_if_terms_repeated() works", {
  expect_snapshot(
    error = TRUE,
    test_if_terms_repeated(y ~ x + y)
  )
  expect_snapshot(
    error = TRUE,
    test_if_terms_repeated(y ~ x + hts(y))
  )
  expect_snapshot(
    error = TRUE,
    test_if_terms_repeated(y ~ x + hts(x))
  )
  expect_silent(
    test_if_terms_repeated(y ~ x)
  )
  expect_silent(
    test_if_terms_repeated(y ~ x + hts(z))
  )
})
