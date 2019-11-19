age_vs_time_page <- tabPanel(
  "Size/Age Over Time",
  titlePanel("The Change in Salmon Size and Age Over Time"),
  
  sidebarLayout(
    # creates sidebar panel
    sidebarPanel(
      # can select either size or age to view data of
      radioButtons("size_age",
                   label = h3("Select Size or Age"),
                   choices = list("Size" = 1, "Age" = 2), 
                   selected = 1),
      
      # can select a river (or rivers) to look at data about
      # none selected means you look at the whole data set
      checkboxGroupInput("river",
                         label = h3("Select river(s)"), 
                         choices = list("Chilkat" = 1, "Stikine" = 2, "Taku" = 3, "Unuk" = 4),
                         selected = NULL),
      
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