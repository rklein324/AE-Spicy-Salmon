library(shiny)

source("app_ui.R")
source("app_server.R")

setwd("~/INFO201/AE-Spicy-Salmon")

shinyApp(ui = ui, server = server)