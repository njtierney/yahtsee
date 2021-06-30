test_that("augment works", {
  augmented <- augment(hts_example_model)
  expect_s3_class(augmented, "tbl")
  expect_equal(nrow(malaria_africa_ts),
               nrow(augmented))
})
