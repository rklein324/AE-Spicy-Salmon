library(shiny)
library(plotly)
library(tidyr)

source("analysis/size_analysis.R")
source("analysis/harvest_analysis.R")
source("analysis/size_age_analysis.R")

size_df <- create_full_df(create_edited_size_age_df())

server <- function(input, output) {
  
  # outputs size plot
  output$size_chart <- renderPlotly({
    df <- create_size_df(size_df, sex = input$sex, rivers = input$river) %>%
      plot_ly(x = ~sampleYear,
              y = ~Length,
              color = ~river,
              type = "scatter",
              mode = "lines+markers")
  })
  
  # outputs harvest plot
  output$harvest_plot <- renderPlotly({
    df <- get_harvest_data(start_year = input$harvest_year[1],
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

  # outputs age plot
  output$age_vs_size <- renderPlot({
    df <- create_size_age_df()
    df <- mutate_size_age_df(df)
    df <- df %>% select(Length, age, Sex, river)
    df <- drop_na(df)
    # df <- df %>% filter(Sex == "female", age == 2)
    
    if(input$selectSex == 1) {
      df <- df %>% filter(Sex == "female")
    } else if(input$selectSex == 0) {
      df <- df %>% filter(Sex == "male")
    }
    
    if (input$river == "Stikine") {
      df <- df %>% filter(river == "Stikine")
    } else if(input$river == "Chilkat") {
      df <- df %>% filter(river == "Chilkat")
    } else if(input$river == "Taku") { 
      df <- df %>% filter(river == "Taku")
    } else if(input$river == "Unuk") {
      df <- df %>% filter(river == "Unuk")
    } 
    
    df2 <- df %>% group_by(age) %>% 
      summarise(aveSize = mean(Length))
    
    ggplot(df2, aes(x=age, y=aveSize)) +
      geom_line() +
      geom_point()
    
  })
  
}