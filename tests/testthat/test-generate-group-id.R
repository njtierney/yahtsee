test_df <- data.frame(
  group = rep(LETTERS[1:3], 3),
  data = 1:9
)

test_that("generate_group_id works", {
  expect_silent(generate_group_id(test_df, group))
  new_group_df <- generate_group_id(test_df, group)
  expect_s3_class(new_group_df, "data.frame")
  expect_s3_class(new_group_df, "tbl")
  expect_snapshot_output(new_group_df)
})
