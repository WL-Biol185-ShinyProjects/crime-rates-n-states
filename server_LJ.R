library(shiny)
library(ggplot2)

# Bar : Offense by Race & Sex

function(input, output) { 
  x <- reactive({
    if(
      input$RaceSexType == "Race") {
      'rnorm(100, input$number)'
      #how to change this pull from race column
    } else {
      'runif(100, max = input$number)'
      #how to change this pull from sex column
    }
  })
  
  #add offense type
  
  output$bar <- renderPlot({
    
    #how to change this input of race, sex, and offense types
    
    ggplot(aggregate, 
           aes_string(input$ 'race or sex' , input$ 'offense type' , ) + 
           geom_bar() + 
           theme(legend.position = "top")
          )
                          })
  
    output$summary <- renderText({
      summary(x())
      
                          })
                       }


