test_that("empty_hts works", {
  expect_false(empty_hts(y ~ x + z))
  expect_true(empty_hts(y ~ x + z + hts()))
  expect_false(empty_hts(y ~ x + z + hts(thing)))
})
