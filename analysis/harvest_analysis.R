library(dplyr)

get_harvest_df <- function() {
  df <- read.csv("data/salmon_harvest.csv",
                 header = TRUE,
                 stringsAsFactors = FALSE)

  return(df)
}

df <- get_harvest_df()

get_harvest_data <- function(start_year = 1975, end_year = 2018, species = c(
  "Chinook", "Coho", "Chum", "Pink", "Sockeye"
)) {

  return(df %>%
    filter(Year >= start_year & Year <= end_year) %>%
    filter(SpeciesCommon %in% species))
}
