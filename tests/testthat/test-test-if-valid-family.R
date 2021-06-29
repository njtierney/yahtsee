test_that("test_if_valid_family works", {
  expect_silent(test_if_valid_family("gaussian"))
})

test_that("test_if_valid_family with expect_snapshot()", {
  skip_on_ci()
  expect_snapshot(
    error = TRUE,
    test_if_valid_family("gauss")
  )
})
