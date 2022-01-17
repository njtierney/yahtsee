test_that("as_hts_inla works", {
  hts_form <- pr ~ avg_lower_age + hts(who_subregion, country)
  expect_identical(
    class(as_hts_inla(hts_example_model,
                      pr ~ avg_lower_age + hts(who_subregion, country))),
    c("hts_inla", "bru", "iinla", "inla")
  )
})
