library(dplyr)

get_harvest_df <- function(start_year = 1975, end_year = 2018, species = c(
  "Chinook", "Coho", "Chum", "Pink", "Sockeye"
)) {
  df <- read.csv("data/salmon_harvest.csv",
                 header = TRUE,
                 stringsAsFactors = FALSE) %>%
    filter(Year >= start_year & Year <= end_year) %>%
    filter(SpeciesCommon %in% species)
  
  return(df)
}