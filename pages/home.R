#-----------------------------------
# Creates query page
#-----------------------------------
home_page <- tabPanel(
  "Home",
  titlePanel("Home"),
  
  sidebarLayout(
    # creates sidebar panel
    sidebarPanel(
      p("Click ", a("here", href = 
        "https://github.com/rklein324/AE-Spicy-Salmon/wiki/Technical-Report"),
        " to read the techincal report")
    ),
    
    # creates main panel
    mainPanel(
      p("Welcome to the world of Spicy Salmon! In this app, you will find",
        "research that deatils the reduction in size of salmon and the",
        "possible reasons that could be correlated to this change.",
        "This project was created as part of our INFO 201 class at UW - ",
        "a special thanks to out TA (Benji) for all his help and support",
        "thoughout the quarter.")
    )
  )
)
