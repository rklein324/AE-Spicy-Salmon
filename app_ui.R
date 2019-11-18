library(shiny)

source('pages/home.R')
source('pages/age_vs_time.R')
source('pages/harvesting.R')
source('pages/salmon_map.R')
source('pages/conclusion.R')

#-----------------------------------
# Creates layout and puts together pages
#-----------------------------------
ui <- navbarPage(
  "Spicy Salmon",
  home_page,
  age_vs_time_page,
  harvesting_page,
  salmon_map,
  conclusion_page
)