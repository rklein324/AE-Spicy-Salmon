library(shiny)

source("app_ui.R")
source("app_server.R")

setwd(getwd())

shinyApp(ui = ui, server = server)