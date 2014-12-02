
# instantiate the project 
library (ProjectTemplate)
load.project (override.config = list (cache_loading = FALSE, 
                                      data_loading  = FALSE,
                                      munging       = FALSE))

# load the ngram model used for type ahead prediction
load ("ngrams.RData")

shinyServer (function (input, output) {
  
  # the next 'N' word predictions
  predictions <- reactive ({
    predict_next_word (input$context, ngrams, N=5)
  })
  
  # show the single best prediction  
  output$nextword <- renderText ({
    validate (need ( nchar (input$context) > 0, "Begin by typing..."))
    
    # what is the word predicted to be next?
    next_word <- predictions()$word[1]

    # if no prediction, prompt the user to keep typing
    if (is.na (next_word))
      next_word <- "Continue typing..."
    
    next_word
  })
  
  # create a plot showing the relative probability of the top N predictions
  output$plot <- renderPlot ({
    
    # create the plot
    ggplot (predictions(), aes (reorder (word, p), p, fill = word)) + 
      geom_bar (stat="identity") + 
      coord_flip () +
      scale_y_continuous (label=percent) +
      xlab ("") +
      ylab ("Probability") +
      theme(legend.position="none", axis.text.y = element_text (size=20)) 
  })
})

