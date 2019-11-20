size_vs_time_page <- tabPanel(
  "Size Over Time",
  titlePanel("The Change in Salmon Size Over Time"),
  
  sidebarLayout(
    # creates sidebar panel
    sidebarPanel(
      # can select whether to separate by sex or not
      radioButtons("sex",
                   label = h3("Would you like to separate the data by sex?"),
                   choices = list("No" = 1, "Yes" = 2),
                   selected = 1),
      
      # can select a river (or rivers) to look at data about
      # none selected means you look at the whole data set
      radioButtons("river",
                   label = h3("Select river"),
                   choices = list("All" = "All",
                                  "Chilkat" = "Chilkat",
                                  "Stikine" = "Stikine",
                                  "Taku" = "Taku",
                                  "Unuk" = "Unuk"),
                   selected = "All"),
      
      # can change the range of years to look at the data
      sliderInput("year_range",
                  label = h3("Years"),
                  min = 1988, 
                  max = 2018,
                  value = c(1988, 2018),
                  sep = "") # means that there won't be a comma in the year
      ),
    
    # creates main panel with description and chart
    mainPanel(
      p("salmon have been changing in size (length in millimeters) over time;",
        "this is shown in the data collected by",
        "the Alaska Department of Fish and Game"),
      p("this chart shows that change"),
      p("you can decide to separate the data into males and females or not,",
        "but separating it will result in less acurate data,",
        "as not all observations recorded the sex"),
      p("to see more specific information, you can select",
        "a specific river in alaska to view;",
        "you can also specify that range of time you would like to view"),
      
      plotlyOutput(outputId = "size_chart")
    )
  )
)