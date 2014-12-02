
shinyUI (
    fluidPage (
        titlePanel ("Text Prediction"),
        mainPanel (
            textInput ("context", label = "Start Typing"),
            textOutput ("nextword")
        )
    )
)