
shinyUI (
  fluidPage (
    
    # page title
    titlePanel ("Type Ahead Prediction"),
    
    # the 1st row
    fluidRow (
      
      # allow the user to type
      wellPanel (
        textInput ("context", label = "", value = "Start with a few kind words about"),
        tags$style (type="text/css", "input[type=text] {width: 100%;}"),
        textOutput ("next_word")
      )
    ),
    
    # the 2nd row
    fluidRow (
      
      # a plot showing the top N most likely next words
      column (6,
              h5 ("Top Suggestions"),
              plotOutput ("next_words_plot")
      ),
      
      # a plot showing the predicted words 
      column (6, 
              h5 ("Type Ahead Accuracy"),
              plotOutput ("accuracy_plot")
      )
    ),
    
    # the 3rd row
    fluidRow (
      column (6, 
              helpText ( paste0 ("Figure 1: The top 5 most likely next words and the probability ", 
                                 "of each as calculated by the model."))),
      column (6, 
              helpText ( paste0 ("Figure 2: The cumulative accuracy of type ahead prediction for the current ",
                                 "phrase. The model is considered accurate if the next word appears ", 
                                 "in the top 5 suggestions.")),
              
              helpText ( paste0 ("A phrase such as 'I love you' is broken into 3 sub-phrases and the accuracy is ",
                                 "calculated for each.  The X-axis reflects the length of each sub-phrase; ",
                                 "'I' of length 1, 'I love' of length 2, and 'I love you' of length 3. The Y-axis ",
                                 "reflects the cumulative accuracy of each sub-phrase.")))
    ),
    
    # sub-title
    fluidRow (
      h6 (
        tags$a(href="https://www.linkedin.com/in/nickallenofcolumbus", "Nick Allen"), 
        " - December 2014")
    )
  )
)