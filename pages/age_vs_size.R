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
      p("This page shows the age versus size of the salmon.",
        "In the sidebar window, the user can filter the sex of the salmon",
        "and at the same time select the river. By default, the widget selects 
        'All'for the gender (with radio buttons) and selects all four rivers
        (using checkboxes)."), 
      
      p("This information is obtained from Metadata: Chinook salmon",
        "age, sex, and length data from major rivers in Southeast Alaska, 1988-2017."), 

     
      plotlyOutput(outputId = "age_vs_size"),
      
      p("The chart shows the salmon's change in size as their age develop.",
        "As the age increases, the average size also increases.",
        "The age is measured in years and the size is measured in millimeters.",
        "We had to calculate the average size for each age because age is", 
        "numerically discrete, so we cannot have a scatter plot. The average size", 
        "allows us to obtain one result for each age inorder to format a line graph."),
        
      
        "Chilkat is the only river that has higher average size of salmon",
        "at the age 2 compared to 3 (for both male and female).",
        "We can clearly see that there is something wrong for the female at",
        "the age of 2. There's an anomaly because there's only one fish in the",
        "data for that age whose length is 835mm. Apart from that, the graph",
        "looks like what we expected. Overall, the average size in male and female",
        "are very similar for all ages apart from the anomaly (age = 2 in the",
        "Chilkat river)."),
    )
  )

