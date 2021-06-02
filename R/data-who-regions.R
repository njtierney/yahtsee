#' Who Regions
#'
#' Data containing information on countries and WHO designated regions and
#' ISO 3166-1 alpha-3 country code. From largest to smallest area it goes:
#'  "who_region", "who_subregion", then "country".
#'
#' Format: a data frame with 110 observations on the following 4 variables.
#' \describe{
#'   \item{`who_region`}{A character of WHO region, the largest region size.}
#'   \item{`who_subregion`}{A character of WHO subregion, the second largest
#'    region size.}
#'   \item{`country`}{A character of countries, the smallest region size.}
#'   \item{`country_iso_code`}{A three letter character code adhering to the
#'   standard, ISO 3166-1 alpha-3. For more detail see
#'   \url{https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3.}}
#'   }
#' @name who_regions
#' @docType data
#' @usage data(who_regions)
#' @keywords datasets
"who_regions"
