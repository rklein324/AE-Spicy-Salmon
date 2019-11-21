#-----------------------------------
# Creates summary page
#-----------------------------------
conclusion_page <- tabPanel(
  "Conclusion",
  titlePanel("Conclusion"),
  
  sidebarLayout(
    # creates sidebar panel
    sidebarPanel(
      h3("Data"),
      tags$a(href="https://knb.ecoinformatics.org/view/doi:10.5063/F11R6NSS", "Size and Age Data"),
      tags$a(href="https://www.adfg.alaska.gov/index.cfm?adfg=commercialbyfisherysalmon.salmon_combined_historical", "Harvest Data")
    ),
    
    # creates main panel
    mainPanel(
      p("One of the main strengths of our project is that our data clearly 
      shows a change over time. This concretely shows that salmon size is 
      reducing, and thus we can further correlate age and harvesting to the
      size. Another strength of our project is the visualizations that help
      the viewers better understand and comprehend the change (we will be
      refining this before the final deliverable)."),
      p("One of the main lessons we learned is the importance of a correct
      data set that showed a change over time. If a data set did not have a
      large range of time, it became less reliable in terms of showing concrete
      changes. We also learned the strengths and weaknesses of the different
      visualization methods. In the future, we would like to pursue research on
      the reduction of salmon food in the water bodies where salmon are most
      commonly found."),
      p("Note: In the final deliverable, this page will contain more analysis
      but since we are still in the process of analyzing our data - this
      describes the project strengths, lessons, and future plans.")
    )
  )
)