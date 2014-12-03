
# for shinyapps.io, each helper function file and all libraryies needs to be sourced
source ("helpers.R")

# load the ngram model used for type ahead prediction
load ("ngrams.RData")

shinyServer (function (input, output) {

  # what are the top 'N' most likely words to be next?
  next_words <- reactive ({
    predict_next_word (input$context, ngrams, N = 5)
  })
  
  # what is the single word most likely to be next?
  output$next_word <- renderText ({
    validate (need ( nchar (input$context) > 0, "Begin by typing..."))

    # extract the single most likely word
    w <- next_words()$word[1]
    
    # if no prediction can be made, prompt the user to keep typing
    ifelse (!is.na (w), w,  "Continue typing for further suggestions...")
  })
  
  # plot the relative probability of the top N next words
  output$next_words_plot <- renderPlot ({
    
    # create the plot
    ggplot (next_words(), aes (reorder (word, p), p, fill = word)) + 
      geom_bar (stat = "identity") + 
      scale_y_continuous (label = percent) +
      coord_flip () +
      xlab ("") +
      ylab ("Probability") +
      theme (legend.position = "none", axis.text.y = element_text (size = 20)) 
  })
  
  # calculate accuracy based on what the user has typed
  output$accuracy_plot <- renderPlot ({
    
    # calculate the accuracy across the entire phrase
    phrases <- phrase_accuracy (input$context, ngrams)
    
    ggplot (phrases, aes (length, accuracy)) + 
      geom_point() + 
      geom_line() +
      scale_x_discrete () +
      scale_y_continuous (label = percent) +
      xlab ("Phrase Length") +
      ylab ("Accuracy")
  })
})

