fluidPage(
  # Application title
  titlePanel("Wiki Intro Word Cloud"),
  
  sidebarLayout(
    # Sidebar with a slider and selection inputs
    sidebarPanel(
      textInput("url","WIKI URL", value = "https://en.wikipedia.org/wiki/Machine_learning"),
      actionButton("goButton", "Go!"),
      hr(),
      helpText("Paste a wikipedia page and find its world cloud in Introduction section."),
      helpText("Not always work though, at your risk. Have fun!"),
      helpText("Inspired by word cloud from Shiny Gallery."),
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
)