
# for shinyapps.io, each helper function file and all libraryies needs to be sourced
source ("helpers.R")

# load the ngram model used for type ahead prediction
load ("ngrams.RData")

shinyServer (function (input, output) {

  # predict the top 5 most likely words to be next
  next_words <- reactive ({
    predict_next_word (input$context, ngrams)
  })
  
  # calculate the accuracy across each sub-phrase
  accuracy <- reactive ({
    phrase_accuracy (input$context, ngrams)
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
    
    ggplot (next_words(), aes (reorder (word, p), p, fill = word)) + 
      geom_bar (stat = "identity") + 
      scale_y_continuous (label = percent) +
      coord_flip () +
      xlab ("") +
      ylab ("Probability") +
      theme (legend.position = "none", axis.text.y = element_text (size = 20)) 
  })
  
  # visualize accuracy across the entire phrase
  output$accuracy_plot <- renderPlot ({

    ggplot (accuracy (), aes (length, accuracy)) + 
      geom_line () +
      geom_point (aes (color = as.character(accurate)), size = 5) + 
      scale_colour_manual (values = c("TRUE"="green", "FALSE"="red")) +
      scale_x_discrete (labels = accuracy()$word) +
      scale_y_continuous (label = percent, limits = c(0, 1)) +
      xlab ("") +
      ylab ("Cumulative Accuracy") +
      theme (legend.position = "none")
  })
  
  # display the tree of predictions for each sub-phrase
  output$phrase_tree <- renderSimpleNetwork ({
    acc <- accuracy ()
    
    # create links for the words typed by the user - these should be weighted heavily
    word_links <- acc [, phrase, by = context]
    setnames (word_links, c("source","target"))

    # create links for the model's suggestions - weighted by probability
    sugg_links <- rbindlist (list (acc [, w1, by = context],
                                   acc [, w2, by = context],
                                   acc [, w3, by = context],
                                   acc [, w4, by = context],
                                   acc [, w5, by = context]))
    setnames (sugg_links, c("source", "target"))
    sugg_links <- sugg_links [complete.cases (sugg_links)]
    
    # create a network plot
    links <- rbind (word_links, sugg_links)
    if (nrow (links) < 100) {
      simpleNetwork (links, font = 16)
    }
  })
})

