test_that("extract_fixed works", {
  expect_snapshot(
    extract_fixed(y ~ x)
    )

  expect_snapshot(
    extract_fixed(y ~ x + z)
    )

  expect_snapshot(
    extract_fixed(y ~ x + z + hts(group))
    )

  expect_snapshot(
    extract_fixed(y ~ x + z + hts(group, area))
    )
})
