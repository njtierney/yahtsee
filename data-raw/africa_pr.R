## code to prepare `africa_pr` dataset goes here
library(malariaAtlas)
library(clock)
library(tidyverse)
library(yahtsee)
library(tsibble)

# getPR(continent = "Africa", species = "Pf") %>% autoplot()

malaria_africa_raw <- getPR(continent = "Africa", species = "Pf") %>%
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
         -pcr_type)

malaria_africa_extra_cols <- malaria_africa_reduced %>%
  select(country,
         country_id,
         continent_id,
         date,
         species) %>%
  distinct() %>%
  arrange(country, date)

malaria_africa_summarised <- malaria_africa_reduced %>%
  group_by(country_id,
           date) %>%
  summarise(total_positive = sum(positive),
            total_examined = sum(examined),
            avg_lower_age = mean(lower_age),
            avg_upper_age = mean(upper_age),
            pr = total_positive / total_examined) %>%
  right_join(malaria_africa_extra_cols,
             by = c("country_id",
                    "date")) %>%
  relocate(continent_id,
           country,
           .before = country_id) %>%
  mutate(year = get_year(date),
         month = get_month(date),
         .after = date)
# sum positive
# sum examined
# recompute the PR, based on the sum of positive and examined

malaria_africa_ts <- as_tsibble(x = malaria_africa_summarised,
                                key = country,
                                index = date) %>%
  # who_regions data is exported in this package
  left_join(who_regions,
            by = c("country_id" = "country_iso_code",
                   "country")) %>%
  relocate(who_region, who_subregion, .before = country)

malaria_africa_ts

usethis::use_data(malaria_africa_ts, overwrite = TRUE)
