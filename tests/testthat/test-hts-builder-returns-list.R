test_that("hts_builder returns a list", {
  built_hts_call <- hts_builder(
    .data = malaria_africa_ts,
    who_region,
    who_subregion,
    country
  )
  expect_type(built_hts_call, "language")
  expect_length(built_hts_call, 3)
})
