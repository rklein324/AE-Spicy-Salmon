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
      p("salmon have been changing in size (aka length) over time;",
        "this is shown in the data collected by the Alaska Department of Fish and Game"),
      p("this chart shows that change, showing the change in males, females, and total;",
        "the total will be larger than the sum of the male and female data as some data is missing"),
      p("to see more specific information, you can select a specific river in alaska to view;",
        "you can also specify that range of time you would like to view"),
      h1("chart goes here")
    )
  )
)