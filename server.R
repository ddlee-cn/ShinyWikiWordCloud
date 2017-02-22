function(input, output) {

  # Define a reactive expression for the document term matrix
  terms <- reactive({
    input$goButton
    
    ht<-read_html(input$url)
    
    body<-ht %>%
      html_nodes(xpath='//div/p[following-sibling::div[@id="toc"]]') %>%
      html_text()
    
    text <- paste(body, collapse = '')
    isolate({
        getTermMatrix(text)
      })
  })
  
  output$plot <- renderPlot({
    v <- terms()
    wordcloud(names(v), v, scale=c(4,0.5),
              min.freq = input$freq, max.words=input$max,
              colors=brewer.pal(8, "Dark2"))
  })
}