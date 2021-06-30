test_that("glance works", {
  glanced <- glance(hts_example_model)
  expect_s3_class(glanced, "tbl")
  expect_snapshot(glanced)
})
