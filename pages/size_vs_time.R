library(plotly)

size_vs_time_page <- tabPanel(
  "Size Over Time",
  titlePanel("The Change in Salmon Size Over Time"),
  
  sidebarLayout(
    # creates sidebar panel
    sidebarPanel(
      # can choose to view the average for males, females, or total average
      radioButtons("sex",
                   label = h3("Sex"),
                   choices = list("Total" = "total",
                                  "Male" = "male",
                                  "Female" = "female"),
                   selected = "total"),
      
      # can select the average of a single river or total average
      checkboxGroupInput("river",
                   label = h3("Select river"),
                   choices = list("Chilkat" = "Chilkat",
                                  "Stikine" = "Stikine",
                                  "Taku" = "Taku",
                                  "Unuk" = "Unuk"),
                   selected = "All")
      ),
    
    # creates main panel with description and plot
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
      
      plotlyOutput(outputId = "size_plot")
    )
  )
)
