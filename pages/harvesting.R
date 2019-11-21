library(plotly)

harvesting_page <- tabPanel(
  "Harvesting",
  titlePanel("Harvesting"),
  
  sidebarLayout(
    # creates sidebar panel
    sidebarPanel(
      selectInput("harvest_y_axis", "Y-axis variable",
                  choices = list("Number of Fish" = "NumberOfFish",
                                 "Pounds" = "Pounds",
                                 "Revenue" = "EstimatedExvesselValue"),
                  selected = "NumberOfFish"),
      selectInput("harvest_species", "Species",
                     multiple = TRUE, selectize = TRUE,
                  choices = c("Chinook", "Chum", "Coho", "Pink", "Sockeye"),
                  selected = c("Chinook", "Chum", "Coho", "Pink", "Sockeye")),
      sliderInput("harvest_year", "Harvest Year", min = 1975, max = 2018,
                  value = c(1975, 2018), sep = "")
      
    ),
    
    # creates main panel
    mainPanel(
      p("On this page, you can manipulate the variables to see:"),
      tags$ul(
        tags$li("How much salmon was harvested (in pounds)"),
        tags$li("The number of salmon fish harvested"),
        tags$li("The estimated revenue from sales in USD")
      ),
      p("The data in the chart below is sourced from Alaska Department of Fish and Game (ADF&G)
        fish tickets and Commercial Fisheries Entry Commission (CFEC) estimates of gross earnings."),
      p("These data contain all species of salmon combined
        (Chinook, sockeye, coho, chum, and pink salmon)."),
      
      plotlyOutput("harvest_plot")
    )
  )
)