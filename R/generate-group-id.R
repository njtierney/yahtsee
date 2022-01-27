
generate_group_id <- function(.data, group) {
  grps <- tidyselect::eval_select(rlang::enexpr(group), .data)
  group_vec <- .data[[grps]]

  # Get sorted group IDs
  group_val <- unique(group_vec)
  group_pos <- match(seq_along(group_val), order(group_val))

  # Compute groups
  group_id <- group_pos[vctrs::vec_group_id(group_vec)]

  tibble::new_tibble(
    stats::setNames(list(group_id), glue::glue(".{ names(grps) }_id"))
  )
}
