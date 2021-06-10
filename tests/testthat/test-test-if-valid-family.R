test_that("test_if_valid_family works", {
  expect_silent(test_if_valid_family("gaussian"))
  expect_snapshot(
    error = TRUE,
    test_if_valid_family("gauss")
    )
})
