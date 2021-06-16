test_that("test_if_formula works", {
  expect_snapshot_error(
    test_if_formula("y ~ x")
  )
  expect_snapshot_error(
    test_if_formula(y + x)
  )
  expect_snapshot_error(
    test_if_formula(y - x)
  )
  expect_silent(
    test_if_formula(y ~ x)
  )
})
