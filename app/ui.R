
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
                helpText (textOutput ("next_word"))
            )
        ),
        
        # the 2nd row
        fluidRow (
            
            # a plot showing the top N most likely next words
            column (4,
                    h5 ("Top Suggestions"),
                    plotOutput ("next_words_plot")
            ),
            
            # a plot showing the predicted words 
            column (4, 
                    h5 ("Type Ahead Accuracy"),
                    plotOutput ("accuracy_plot")
            ),
            
            # a network graph showing the model's cumulative suggestions
            column (4, 
                    h5 ("Phrase Tree"),
                    networkD3::simpleNetworkOutput ("phrase_tree"))
        ),
        
        # the 3rd row
        fluidRow (
            column (4, 
                    helpText ( 
                        paste0 ("Figure 1: The most likely next words and the probability ", 
                                "of each as calculated by the model."))),
            
            column (4, 
                    helpText ( 
                        paste0 ("Figure 2: The cumulative accuracy of type ahead prediction for the current ",
                                "phrase. The model is considered accurate if the next word appears ", 
                                "in the top 5 suggestions."))),
            
            column (4, 
                    helpText (paste0 ("Figure 3: The cumulative suggestions of the model for the entire phrase.  Rearrange, ",
                                      "click, and move the nodes to uncover relations between the model's suggestions. ",
                                      "Each node containing a caret (^) is a sub-component of the phrase. Those ",
                                      "nodes connected contain the model's suggestions.")))
        ),
        
        fluidRow (
            wellPanel (
                column (4, 
                        align = "left", 
                        tags$a(href="http://rpubs.com/willylane333/46619", 
                               "How does this work?")),
                column (4, 
                        align = "center",
                        tags$a(href="https://github.com/nickwallen/swiftkey-capstone", 
                               "Where is the code?")),
                column (4, align = "right",
                        tags$a(href="https://www.linkedin.com/in/nickallenofcolumbus", 
                               "Who did this?"))
            )
        )
    )
)