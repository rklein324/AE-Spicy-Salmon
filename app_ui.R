library(shiny)

#-----------------------------------
# Creates about page
#-----------------------------------
about_page <- tabPanel(
  "About",
  titlePanel("About Spicy Salmon"),
  
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

#-----------------------------------
# Creates query page
#-----------------------------------
viz_page_1 <- tabPanel(
  "viz 1",
  titlePanel("Viz 1"),
  
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

#-----------------------------------
# Creates summary page
#-----------------------------------
viz_page_2 <- tabPanel(
  "viz 2",
  titlePanel("Viz 2"),
  
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

#-----------------------------------
# Creates summary page
#-----------------------------------
viz_page_3 <- tabPanel(
  "viz 3",
  titlePanel("Viz 3"),
  
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

#-----------------------------------
# Creates summary page
#-----------------------------------
conclusion_page <- tabPanel(
  "conclusion",
  titlePanel("Conclusion"),
  
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

#-----------------------------------
# Creates layout and puts together pages
#-----------------------------------
ui <- navbarPage(
  "Spicey Salmon",
  about_page,
  viz_page_1,
  viz_page_2,
  viz_page_3,
  conclusion_page
)