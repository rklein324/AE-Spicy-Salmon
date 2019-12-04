source("analysis/size_age_analysis.R")

# creates the data frame to be ploted based off the sex (total, male, female)
# and the rivers (all, Chilkat, Stikine, Taku, Unuk) selected
create_size_df <- function(df, sex = "total",
                rivers = c("All", "Chilkat", "Stikine", "Taku", "Unuk")) {
  filter(df, Sex == sex) %>%
    filter(river %in% rivers)
}

# creates the data frame of average lengths for each combination of
# sex (total, male, female) and river (all, Chilkat, Stikine, Taku, Unuk)
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
  df <- full_join(sep_df, not_sep_df,
                  by = c("sampleYear", "river", "Sex", "Length")) %>%
    full_join(sep_sex_df, by = c("sampleYear", "river", "Sex", "Length")) %>%
    full_join(sep_river_df, by = c("sampleYear", "river", "Sex", "Length")) %>%
    arrange(sampleYear)
}
