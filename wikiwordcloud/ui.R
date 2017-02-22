navbarPage("Wiki Word Cloud Builder",
  # Application title

  tabPanel("App",
  sidebarLayout(
    # Sidebar with a slider and selection inputs
    sidebarPanel(
      textInput("url","WIKI URL", value = "https://en.wikipedia.org/wiki/Machine_learning"),
      actionButton("goButton", "Go!"),
      hr(),
      helpText("Just paste a wikipedia page and click the GO! button."),
      hr(),
      sliderInput("freq",
                  "Minimum Frequency:",
                  min = 1,  max = 30, value = 2),
      sliderInput("max",
                  "Maximum Number of Words:",
                  min = 1,  max = 100,  value = 50)
    ),
    
    # Show Word Cloud
    mainPanel(
      plotOutput("plot")
    )
  )
  ),
  tabPanel("Documentation",
           helpText("Usage"),
           hr(),
           helpText("Just Paste any wiki page and click the GO! button."),
           helpText("Drag the slider to change min and max frequency of words"),
           helpText("Not always work though, as not all html structure of wiki pages are exactly the same. Have fun!"),
           helpText("Inspired by word cloud from Shiny Gallery.")
  )
)