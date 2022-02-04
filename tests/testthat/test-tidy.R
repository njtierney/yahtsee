test_that("tidy works", {
  tidied <- tidy(hts_example_model)
  expect_s3_class(tidied, "tbl")
  expect_snapshot(tidied)
})
