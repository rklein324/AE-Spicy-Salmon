library(shiny)
library(plotly)
library(ggplot2)

source("analysis/size_analysis.R")
source("analysis/harvest_analysis.R")

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
  
  
  output$harvest_plot <- renderPlotly({
    df <- get_harvest_df(start_year = input$harvest_year[1],
                         end_year = input$harvest_year[2],
                         species = input$harvest_species)

    df %>%
      plot_ly(x = ~Year,
              y = ~get(input$harvest_y_axis),
              color = ~SpeciesCommon,
              type = 'scatter',
              mode = 'lines+markers') %>%
      layout(yaxis = list(
        title = input$harvest_y_axis
      ))
  })
  
}