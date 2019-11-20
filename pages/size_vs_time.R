size_vs_time_page <- tabPanel(
  "Size Over Time",
  titlePanel("The Change in Salmon Size Over Time"),
  
  sidebarLayout(
    # creates sidebar panel
    sidebarPanel(
      # can select a river (or rivers) to look at data about
      # none selected means you look at the whole data set
      radioButtons("river",
                         label = h3("Select river"), 
                         choices = list("Chilkat" = 1, "Stikine" = 2, "Taku" = 3, "Unuk" = 4, "All" = 5),
                         selected = 5),
      
      # can change the range of years to look at the data
      sliderInput("year_range",
                  label = h3("Years"),
                  min = 1988, 
                  max = 2018,
                  value = c(1988, 2018),
                  sep = "") # means that there won't be a comma in the year
      ),
    
    # creates main panel
    mainPanel(
      h3("introduction to chart"),
      h5("chart goes here")
    )
  )
)