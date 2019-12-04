library(shiny)

source('pages/home.R')
source('pages/size_vs_time.R')
source('pages/harvesting.R')
source('pages/age_vs_size.R')
source('pages/conclusion.R')
source('pages/about.R')

# creates layout and puts together pages
ui <- navbarPage(
  "Shrinking Salmon",
  home_page,
  size_vs_time_page,
  age_vs_size_page,
  harvesting_page,
  conclusion_page,
  about_page
)
