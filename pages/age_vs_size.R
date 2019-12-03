age_vs_size_page <- tabPanel(
  "Age Vs Size",
  titlePanel("Comparing the Age and Size of Salmon"),
  
  sidebarLayout(
    # creates sidebar panel
    sidebarPanel(
      radioButtons("selectSex",
                   label = "Select Male or Female",
                   choices = list("Male" = 0, "Female" = 1, "All" = 2),
                   selected = 2
                   ),
     
      
      checkboxGroupInput("selectRiver",
                         label = h3("Select river"),
                         choices = list("Chilkat" = "Chilkat",
                                        "Stikine" = "Stikine",
                                        "Taku" = "Taku",
                                        "Unuk" = "Unuk"),
                         selected = c("Chilkat", "Stikine", "Taku", "Unuk"))
    ),
    
      
      
      
      #("river",
                  # # label = h3("Select river"),
                  #  choices = list("All" = "All",
                  #                 "Chilkat" = "Chilkat",
                  #                 "Stikine" = "Stikine",                    # CHANGE TO CHECK BOXES
                  #                 "Taku" = "Taku",
                  #                 "Unuk" = "Unuk"),
                  #  selected = "All"
   
    # ))
    # ,
    
    # creates main panel
    mainPanel(
      p("This page shows the age versus  size of the salmon.",
        "In the sidebar window, the user can filter the sex of the salmon",
        "and at the same time select the river."), 
        
      p("The chart shows the change in salmon size as their age develop.",
        "We can clearly see that there is something wrong with the female at",
        "the age of 2. There's a anomaly because there's only one fish in the",
        "data for that age whose length is 835mm. Apart from that, the graph",
        "looks like what we expected."),
      
      p("We obtained this information from Metadata: Chinook salmon",
        "age, sex, and length data from major rivers in Southeast Alaska, 1988-2017."), 

     
      plotlyOutput(outputId = "age_vs_size")
    )
  )
)