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
      
      radioButtons("river",
                   label = h3("Select river"),
                   choices = list("All" = "All",
                                  "Chilkat" = "Chilkat",
                                  "Stikine" = "Stikine",
                                  "Taku" = "Taku",
                                  "Unuk" = "Unuk"),
                   selected = "All"
    ))
    ,
    
    # creates main panel
    mainPanel(
      p("blah blahdhfjhdbfghbhersgbhjreghjrbjeh;",
        "this is shown in the data collected by",
        "the Alaska Department of Fish and Game"),
      p("this chart shows that change"),
     
      plotOutput(outputId = "age_vs_size")
    )
  )
)