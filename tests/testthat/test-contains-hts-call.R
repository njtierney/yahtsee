test_that("contains_hts_call works", {
  expect_false(contains_hts_call(y ~ x + z))
  expect_false(contains_hts_call(y ~ x + z + hts()))
  expect_true(contains_hts_call(y ~ x + z + hts(thing)))
})
