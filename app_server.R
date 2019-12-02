library(shiny)
library(plotly)
library(ggplot2)
library(tidyr)

source("analysis/size_analysis.R")
source("analysis/harvest_analysis.R")
source("analysis/size_age_analysis.R")

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

  output$age_vs_size <- renderPlot({
    pums_df <- create_size_age_df()
    pums_df <- mutate_size_age_df(pums_df)
    pums_df <- pums_df %>% select(Length, age, Sex, river)
    pums_df <- drop_na(pums_df)
    # df <- df %>% filter(Sex == "female", age == 2)
    
    if(input$selectSex == 1) {
      pums_df <- pums_df %>% filter(Sex == "female")
    } else if(input$selectSex == 0) {
      pums_df <- pums_df %>% filter(Sex == "male")
    }

    # if (input$river == "Stikine") {
    #   df <- df %>% filter(river == "Stikine")
    # } else if(input$river == "Chilkat") {
    #   df <- df %>% filter(river == "Chilkat")
    # } else if(input$river == "Taku") {
    #   df <- df %>% filter(river == "Taku")
    # } else if(input$river == "Unuk") {
    #   df <- df %>% filter(river == "Unuk")
    # }
    if (input$Stikine == FALSE) {
      df <- filter(df, river != "Stikine")
    }
    else if (input$Chilkat == FALSE) {
      df <- filter(df, river != "Chilkat")
    }
    else if (input$Taku == FALSE) {
      df <- filter(df, river != "Taku")
    }
    else if (input$Unuk == FALSE) {
      df <- filter(df, river != "Unuk")
    }  
      
    pums_dff <- pums_df %>% group_by(age) %>% 
      summarise(aveSize = mean(Length))
    
    ggplot(pums_dff, aes(x=age, y=aveSize)) +
     geom_line() +
     geom_point()

    # dff %>%
    #   plot_ly(x = ~age,
    #           y = ~aveSize,
    #           type = 'scatter',
    #           mode = 'lines+markers') %>%
    #   layout(yaxis = list(title = "Average size"))
  })
  
  
  
}