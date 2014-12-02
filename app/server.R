
# library (ProjectTemplate)
# load.project ()

shinyServer (function (input, output) {
  
    # predict the next word
    output$nextword <- renderText ({
        nextwords <- predict_next_word (input$context, ngrams, N=3)
        
        # replace the end-of-sentence marker
        nextwords [nextwords == "$"] <- "."
        
        nextwords
    })
})