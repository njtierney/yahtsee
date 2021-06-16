test_that("extract_hts works", {
    expect_snapshot(
      error = TRUE,
      extract_hts(y ~ x)
    )

    expect_snapshot(
      error = TRUE,
      extract_hts(y ~ x + z)
    )

    expect_snapshot(
      extract_hts(y ~ x + z + hts(group))
    )

    expect_snapshot(
      extract_hts(y ~ x + z + hts(group, area))
    )
  })
