test_that("as_hts_inla works", {
  hts_form <- pr ~ avg_lower_age + hts(who_subregion, country)
  expect_identical(
    class(as_hts_inla("thing", hts_form)),
    c("hts_inla", "list")
  )
})
