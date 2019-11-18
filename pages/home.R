#-----------------------------------
# Creates query page
#-----------------------------------
home_page <- tabPanel(
  "Home",
  titlePanel("Home"),
  
  sidebarLayout(
    # creates sidebar panel
    sidebarPanel(
      h3("stuff")
    ),
    
    # creates main panel
    mainPanel(
      h3("stuff")
    )
  )
)
