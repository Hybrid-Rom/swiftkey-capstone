

#load.project ()

shinyServer (function (input, output) {
  
    # predict the next word
    output$nextword <- renderText ({
        input$go
        nextword <- predict_next_word (input$context, ngrams)
        
        # correct
        if (nextword == "$") 
            nextword = "."
        
        nextword
    })
})