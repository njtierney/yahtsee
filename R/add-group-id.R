#' Helper function to add group ID information
#'
#' Some modelling software needs group data as an index. This means instead of
#'  `c("AU", "AU", "UK", "UK", "NZ")` you need `c(1, 1, 2, 2, 3)`,
#'  corresponding to each of the groups. This function makes it simpler to add
#'  that information to a dataframe.
#'
#' @param .data data.frame
#' @param group group to add the ID for
#'
#' @return `data.frame` with additional column named ".group_id", where "group" is
#'   named after the variable you would like to add the group ID for.
#' @export
#'
#' @examples
#' malaria_africa_ts %>% add_group_id(country)
add_group_id <- function(.data, group) {
  .data %>%
    dplyr::group_by({{ group }}) %>%
    dplyr::mutate(".{{ group }}_id" := dplyr::cur_group_id(),
      .after = {{ group }}
    ) %>%
    dplyr::ungroup({{ group }})
}
