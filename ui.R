fluidPage(
        theme = shinytheme("cyborg"),

        titlePanel("Word Prediction App"),

        sidebarLayout(

                sidebarPanel(
                        
                        textInput("inputtext", label = h3("Type Text Here")),

                        
                        helpText("Type up to 3 words.  ",
                                 "App is not case sensitive and punctuation is ok.  ",
                                 "Do not input any special characters or a space after the last word."),
                        
                        br(),
                        
                        submitButton("Predict Next Word"),
                        
                        br(),
                        
                        helpText("Note: If the app is unable to predict the next word, it will display",
                                 "the most common unigram from the data set: the")
                ),
                mainPanel(textOutput("text"),
                          style = "font-family: 'Impact'; color: #FF1493; text-align: center; font-size: 125px; padding: 60px"
                          )
        )
)

