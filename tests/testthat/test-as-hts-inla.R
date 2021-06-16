test_that("as_hts_inla works", {
  expect_identical(
    class(as_hts_inla("thing")),
    c("hts_inla", "character")
  )
  expect_identical(
    class(as_hts_inla(lm(speed ~ dist, cars))),
    c("hts_inla", "lm")
  )
})
