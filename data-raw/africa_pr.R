## code to prepare `africa_pr` dataset goes here
library(malariaAtlas)
library(clock)
library(tidyverse)
library(malariahts)
listData(datatype = "pr points")

malaria_africa_raw <- getPR(continent = "Africa", species = "both") %>%
  as_tibble()

malaria_africa_tidy <- malaria_africa_raw %>%
  filter(year_start == year_end,
         month_start == month_end) %>%
  select(-year_end,
         -month_end) %>%
  rename(year = year_start,
         month = month_start) %>%
  relocate(country,
           country_id,
           continent_id,
           year,
           month) %>%
  mutate(date = date_build(year = year,
                           month = month),
         .after = month) %>%
  arrange(country,
          date)

# subset down to one measurement per country per year per month
malaria_africa_reduced <- malaria_africa_tidy %>%
  group_by(country,date) %>%
  slice(1) %>%
  ungroup()

malaria_africa_ts <- as_tsibble(x = malaria_africa_reduced,
                                key = country,
                                index = date) %>%
  select(-dhs_id,
         -site_id,
         -site_name,
         -rdt_type,
         -latitude,
         -longitude,
         -malaria_metrics_available,
         -location_available,
         -permissions_info,
         -citation1,
         -citation2,
         -citation3,
         -rural_urban,
         -pcr_type) %>%
  # who_regions data is exported in this package
  left_join(who_regions,
            by = c("country_id" = "country_iso_code",
                   "country")) %>%
  relocate(who_region, who_subregion, .before = country)

malaria_africa_ts

usethis::use_data(malaria_africa_ts, overwrite = TRUE)
