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
      p("Welcome to the Shrinking Salmon App! In this app, you will
      find research that details the reduction in size of salmon in
      the Pacific North West and the possible reasons that could be
      correlated to this change."),

      p("The research question our team investigated was - Does early
      maturation age and harvesting impact the size of salmon?
      This app looks at the Chilkat, Stikine, Taku, and Unuk rivers as they are
      the primary rivers in which Salmon are found. The app also notes the five
      most common type of salmon found in the Pacific North West - Pink,
      Sockeye, Chinook, Chum, and Coho."),

      p("This research is extremely valuable and relevant currently as
      the decreasing size of salmon is impacting Pacific North
      West's people, economy, and ecosystems. The subsistence users
      are catching the same number of salmon, but smaller in size,
      and are thus facing a reduction of nutrients, protein, and
      calories, which significantly impact their daily health. The commercial
      fishermen are losing profit as fish with less meat cannot be processed
      into high value products. Additionally, key aspects of Pacific North
      West's ecosystems that rely on salmon nutrients are facing issues.
      The animals that rely on a salmon diet are getting less food and
      nutrients, the smaller salmon are also bringing in lesser nutrients,
      and most significantly smaller salmon are laying fewer eggs - thus
      reducing the overall salmon population."),

      p("Therefore, through this analysis our research team hopes to shed light
      on the importance issue of salmon size reduction and propose
      correlated reasons and potential solutions."),

      p("Data sets we used in the analysis:"),
      tags$ul(
        tags$li("Knowledge Network for Biocomplexity (KNB):
        This dataset provided us with data on Chinook salmon age, sex, and
        length data from major rivers in Southeast Alaska, 1988-2017."),
        tags$li("Alaska Department of Fish and Game:
        This dataset provided us with data about all salmon species
        combined historical harvest rankings.")
      )
    )
  )
)
