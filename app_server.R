library(shiny)
library(plotly)
library(ggplot2)

source('analysis/size_analysis.R')

server <- function(input, output) {
  
  output$size_chart <- renderPlot({
    df <- create_size_df(create_edited_size_age_df(), sep = input$sex, place = input$river)
    if(input$sex == 2) {
      ggplot(data = df, aes(x = sampleYear, y = Length, color = Sex)) +
        geom_line() +
        geom_point()
    } else {
      ggplot(data = df, aes(x = sampleYear, y = Length)) +
        geom_line() +
        geom_point()
    }
  })
  
}