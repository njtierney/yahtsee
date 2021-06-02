#' Prevalence Rate data of Malaria in Africa
#'
#' Data containing information on malaria prevalence in Africa. Data was
#'   extracted using the `malariaAtlas` package. If using this data, please
#'   cite:
#'
#'   Pfeffer, D.A., Lucas, T.C., May, D., Harris, J., Rozier, J., Twohig, K.A.,
#'   Dalrymple, U., Guerra, C.A., Moyes, C.L., Thorn, M., Nguyen, M., et al.
#'   2018. malariaAtlas: an R interface to global malariometric data hosted by
#'   the Malaria Atlas Project. Malaria Journal, 17(1), p.352.
#'
#' Format: a 'tsibble' data frame with 1,117 observations on the following 15
#'   variables.
#' \describe{
#'   \item{`who_region`}{A character of WHO region, the largest region size.}
#'   \item{`who_subregion`}{A character of WHO subregion, the second largest
#'    region size.}
#'   \item{`country`}{A character of countries, the smallest region size.}
#'   \item{`country_id`}{A three letter character code adhering to the
#'   standard, ISO 3166-1 alpha-3. For more detail see
#'   \url{https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3.}}
#'   \item{`continent_id`}{A character of continent name}
#'   \item{`year`}{integer of year data recorded}
#'   \item{`month`}{integer of month data recorded}
#'   \item{`date`}{date class of year+month recorded. Defaults to day = 1 as day was not provided.}
#'   \item{`lower_age`}{lower age range}
#'   \item{`upper_age`}{upper age range}
#'   \item{`examined`}{integer, number of people examined}
#'   \item{`positive`}{numeric, number of positive cases}
#'   \item{`pr`}{positive rate - given from positive/examined}
#'   \item{`species`}{Mosquito species}
#'   \item{`method`}{method of measurement}
#'   }
#' @name malaria_africa_ts
#' @docType data
#' @usage data(malaria_africa_ts)
#' @keywords datasets
"malaria_africa_ts"
