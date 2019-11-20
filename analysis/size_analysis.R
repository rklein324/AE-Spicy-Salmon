library(dplyr)

source('size_age_analysis.R')

# creates the data frame for the size chart
mutate_size_age_df <- function(df, sep = 1, place = "All") {
  # filters for the river selected if applicable
  if(place != "All") {
    df <- filter(df, df$river == place)
  }
  
  # these if statements define what columns will be in the final summarized df
  if(sep == 2 && place != "All") {
    df <- group_by(df, sampleYear, river, Sex)
  } else if(place != "All") {
    df <- group_by(df, sampleYear, river)
  } else if(sep == 2) {
    df <- group_by(df, sampleYear, Sex)
  } else {
    df <- group_by(df, sampleYear)
  }
  
  # does the summarizing, gets rid of rows with NAs
  df <- summarize(df, Length = mean(Length, na.rm = TRUE)) %>% 
    drop_na()
}