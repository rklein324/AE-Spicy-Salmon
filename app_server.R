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
  output$age_vs_size <- renderPlotly({
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
    

    # Filter from check box
    selectedRiver <- input$selectRiver
    pums_df <- pums_df %>% filter(river %in% selectedRiver)
    
    # if (input$river[2] == FALSE) {
    #   
    # }
    # else if (input$river[1] == FALSE) {
    #   pums_df <- filter(pums_df, river != "Chilkat")
    # }
    # else if (input$river[3] == FALSE) {
    #   pums_df <- filter(pums_df, river != "Taku")
    # }
    # else if (input$river[4] == FALSE) {
    #   pums_df <- filter(pums_df, river != "Unuk")
    # }
    
    
    pums_dff <- pums_df %>% group_by(age) %>% 
      summarise(aveSize = mean(Length))
    
    # ggplot(pums_dff, aes(x=age, y=aveSize)) +
    #  geom_line() +
    #  geom_point()
    
  

     pums_dff %>%
       plot_ly(x = ~age,
               y = ~aveSize,
               type = 'scatter',
               mode = 'lines+markers') %>%
       layout(yaxis = list(title = "Average size"))
     
     
  })
    
    

  
  
}