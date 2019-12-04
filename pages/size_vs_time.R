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
                   label = h3("River(s)"),
                   choices = list("All" = "All",
                                  "Chilkat" = "Chilkat",
                                  "Stikine" = "Stikine",
                                  "Taku" = "Taku",
                                  "Unuk" = "Unuk"),
                   selected = "All")
      ),
    
    # creates main panel with description and plot
    mainPanel(
      
      # introduction to plot
      p("The graph below shows how salmon have been changing in size (length
        in millimeters) over theyears. The data is averaged for each of the
        possible combinations of sex and river you select."),
      p("For sex, 'Total' (ignoring sex) includes data not included otherwise
        as some datapoint were missing this information."),
      p("For river(s), 'All' will show how the size has changed ignoring where
        the data was colected."),
      
      # dispays plot
      plotlyOutput(outputId = "size_plot"),
      p(),
      
      # analysis of plot
      p("This data was collected by the Alaska Department of Fish and Game.
        It clearly shows that salmon have been decreasing in size, no matter
        the sex or location (in Alaska) of the salmon.")
    )
  )
)
