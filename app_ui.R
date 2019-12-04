library(shiny)
library(shinydashboard)

source('pages/home.R')
source('pages/size_vs_time.R')
source('pages/harvesting.R')
source('pages/age_vs_size.R')
source('pages/conclusion.R')
source('pages/about.R')

#-----------------------------------
# Creates layout and puts together pages
#-----------------------------------
ui <- dashboardPage(
  dashboardHeader(title = "Shrinking Salmon"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("home")),
      menuItem("Size vs. Time", tabName = "size_vs_time", icon = icon("clock")),
      menuItem("Size vs. Age", tabName = "age_vs_size", icon = icon("stream")),
      menuItem("Harvesting", tabName = "harvesting", icon = icon("fish")),
      menuItem("Conclusion", tabName = "conclusion", icon = icon("hourglass-end")),
      menuItem("About", tabName = "about", icon = icon("address-card"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "home",
              home_page),
      tabItem(tabName = "size_vs_time",
              size_vs_time_page),
      tabItem(tabName = "age_vs_size",
              age_vs_size_page),
      tabItem(tabName = "harvesting",
              harvesting_page),
      tabItem(tabName = "conclusion",
              conclusion_page),
      tabItem(tabName = "about",
              about_page)
    )
  )
)
