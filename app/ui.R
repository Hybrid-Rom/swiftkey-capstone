
shinyUI (
  fluidPage (
    
    # page title
    titlePanel ("Type Ahead Prediction"),
    verticalLayout (
      
      # allow the user to type
      wellPanel (
        textInput ("context", label = ""),
        tags$style (type="text/css", "input[type=text] {width: 100%;}"),
        textOutput ("nextword")
      ),
      
      # a plot showing the predicted words 
      mainPanel (
        h5 ("Top Predictions"),
        plotOutput ("plot")
      )
    )
  )
)