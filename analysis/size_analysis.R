source('analysis/size_age_analysis.R')

create_size_df <- function(df, sex = "total",
                rivers = c("All", "Chilkat", "Stikine", "Taku", "Unuk")) {
  filter(df, Sex == sex) %>% 
    filter(river %in% rivers)
}

# creates the data frame for the size chart
create_full_df <- function(df) {
  sep_df <- group_by(df, sampleYear, river, Sex) %>%
    summarize(Length = mean(Length, na.rm = TRUE)) %>% 
    filter(!is.na(Sex))
  sep_sex_df <- group_by(df, sampleYear, Sex) %>%
    summarize(Length = mean(Length, na.rm = TRUE)) %>% 
    filter(!is.na(Sex)) %>% 
    mutate(river = "All")
  sep_river_df <- group_by(df, sampleYear, river) %>%
    summarize(Length = mean(Length, na.rm = TRUE)) %>% 
    mutate(Sex = "total")
  not_sep_df <- group_by(df, sampleYear) %>%
    summarize(Length = mean(Length, na.rm = TRUE)) %>% 
    mutate(Sex = "total", river = "All")
  df <- full_join(sep_df, not_sep_df) %>%
    full_join(sep_sex_df) %>%
    full_join(sep_river_df) %>%
    arrange(sampleYear)
}