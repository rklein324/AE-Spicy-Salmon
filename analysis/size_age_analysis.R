library(dplyr)
library(stringr)
library(shiny)

# creates data frame from salmon age and size csv
create_size_age_df <- function() {
  df <- read.csv("data/salmon_age_size.csv",
                 header = TRUE,
                 stringsAsFactors = FALSE
  )
  return(df)
}

# mutates the data frame to add a date column, a simplified river column,
# and an age column calculated using the formula given in the data set document
mutate_size_age_df <- function(df) {
  new_df <- mutate(df, date = as.Date(sapply(strsplit(df$sampleDate,' '),
                                             '[',1),'%m/%d/%Y'),
                   river = sapply(strsplit(df$Location,' '), '[',1),
                   # age calculation is from discription of data set
                   age = suppressWarnings(as.numeric(Fresh.Water.Age) + 
                                            as.numeric(Salt.Water.Age) + 1)
                   )
}

# creates the data frame that will be used for further analysis
create_edited_size_age_df <- function() {
  df <- create_size_age_df() %>% 
    mutate_size_age_df() %>% 
    select(date, sampleYear, river, Sex, Length, age)
}

my_df <- create_size_age_df()

# -----------------------------------------------
# SOLEY INFORMATIVE INFORMATION FOR OUR OWN ANALYSIS
# -----------------------------------------------

# returns a data frame of how many values for each (important) column
# are missing per year
summarize_missing_data <- function(df) {
  df <- mutate_size_df(df)
  date <- df[is.na(df$sampleDate),] %>% 
    group_by(sampleYear) %>% 
    summarize(num_missing_date = n())
  length <- df[is.na(df$Length),] %>% 
    group_by(sampleYear) %>% 
    summarize(num_missing_length = n())
  age <- df[is.na(df$age),] %>% 
    group_by(sampleYear) %>% 
    summarize(num_missing_age = n())
  sex <- df[is.na(df$Sex),] %>% 
    group_by(sampleYear) %>% 
    summarize(num_missing_sex = n())
  years <- data.frame(sampleYear = 1988:2018) %>% 
    left_join(date, by = "sampleYear") %>% 
    left_join(length, by = "sampleYear") %>% 
    left_join(age, by = "sampleYear") %>% 
    left_join(sex, by = "sampleYear")
}

# returns a data frame with how many samples were taken for each year
number_obs_per_year <- function(df) {
  group_by(df, sampleYear) %>% 
    summarize(num = n())
}