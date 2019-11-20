create_size_df <- function() {
  df <- read.csv("../data/salmon_age_size.csv",
                 header = TRUE,
                 stringsAsFactors = FALSE
  )
  return(df)
}

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

number_obs_per_year <- function(df) {
  group_by(df, sampleYear) %>% 
    summarize(num = n())
}

mutate_size_df <- function(df) {
  new_df <- mutate(df, date = as.Date(sapply(strsplit(df$sampleDate,' '),
                                             '[',1),'%m/%d/%Y'),
                   river = sapply(strsplit(df$Location,' '), '[',1),
                   # age calculation is from discription of data set
                   age = as.numeric(Fresh.Water.Age) + as.numeric(Salt.Water.Age) + 1
                   )
}

create_edited_size_df <- function() {
  df <- create_size_df() %>% 
    mutate_size_df() %>% 
    select(date, sampleYear, river, Sex, Length, age)
}