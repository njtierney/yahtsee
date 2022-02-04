test_that("yahtsee_sitrep warns when have_inla is FALSE", {
  mockery::stub(yahtsee_sitrep, 'have_inla',FALSE,2)
  expect_snapshot(
    yahtsee_sitrep()
  )
})

test_that("yahtsee_sitrep works when have_inla is TRUE", {
  mockery::stub(yahtsee_sitrep, 'have_inla',TRUE,2)
  expect_snapshot(
    yahtsee_sitrep()
  )
})
