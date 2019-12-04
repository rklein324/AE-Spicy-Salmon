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
        in millimeters) over the years. The data is averaged for each of the
        possible combinations of sex and river you select."),
      p("For sex, 'Total' (ignoring sex) includes data not included otherwise
        as some datapoints were missing this information."),

      # dispays plot
      plotlyOutput(outputId = "size_plot"),

      # analysis of plot
      p("This data was collected by the Alaska Department of Fish and Game.
        There is some missing data, but it is not a significant number as
        compared to the overall number of samples. It is also important to note
        that there are some years where data was only collected from one or two
        rivers which accounts for some of the inconsistency in the data.")
    )
  )
)
