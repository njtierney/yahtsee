## code to prepare `who_regions` dataset goes here
library(countrycode)
who_regions <- read_csv(here("data", "who-regions.csv")) %>%
  mutate(
    country_iso_code = countrycode(
      sourcevar = country,
      origin = "country.name",
      destination = "iso3c"
    ),
    # make zanzibar Tanzania
    country_iso_code = case_when(
      country == "Zanzibar" ~ "TZA",
      TRUE ~ country_iso_code
    )
  ) %>%
  drop_na()

usethis::use_data(who_regions, overwrite = TRUE)
