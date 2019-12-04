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
      p(a("Size and Age Data",
        href = "https://knb.ecoinformatics.org/view/doi:10.5063/F11R6NSS")),
      p(a("Harvest Data",
        href = "https://www.adfg.alaska.gov/index.cfm?
        adfg=commercialbyfisherysalmon.salmon_combined_historical"))
    ),

    # creates main panel
    mainPanel(
      p("Through this analysis, it is evident that over time salmon size in the Pacific Northwest has decreased (please see size vs time page for an interactive graph and a detailed analysis).  Smaller size of Salmon means fewer eggs, thus decreasing the size of the whole salmon population in the Pacific Northwest. The main stakeholders are the Pacific Northwest residents for whom salmon is a large part of their diet, the fishermen, who lose profits from the decrease in total pounds of fish they catch, and the entire world who's ecosystem is being affected by the change. There has to be a balance between catching enough salmon to eat or make a living, and leaving enough salmon to stop the decrease of the population. There is also a tension between those who put more emphasis on the world and the salmon's health and those who have more of a monetary interest in selling the fish. 

In search for the reason for the reduction in size, the researching team also analyzed the correlation between size & age and size and number of salmon being harvested. Through the data, researchers drew the conclusion that as age increases, size increases for salmon. However, due to monetary benefits salmon are being harvested more frequently and at younger ages - thus not allowing the salmon to mature fully and reach their proper size. By analyzing harvesting data, researchers noted that for some types of the salmon such as the Chinook and the Coho harvesting does not impact size. For other types of salmon such as the sock eye and pink an increase in harvesting can be correlated to a reduction in salmon size. 

The researchers suggest laws for harvesting of some salmon - this would allow the salmon to grow their full size and not monetarily impact people (as they would be able to harvest other types of salmon). 
"),

    )
  )
)
