library(shiny)
library(ggplot2)

# Bar : Offense by Race & Sex

function(input, output) { 
  x <- reactive({
    if(
      input$RaceSexType == "Race") {
      aggregate_edited$race
    } else {
      aggregate_edited$sex
    }
  })
  
  #add offense type
  
  output$bar <- renderPlot({
    
    ggplot(aggregate, 
           aes_string(input$RaceSex, input$OffenseType) + 
           geom_bar() + 
           theme(legend.position = "top")
          )
                          })
  
    output$summary <- renderText({
      summary(x())
      
                          })
                       }



# Histogram: Age vs. Offense

function(input, output) {
  
  x <- reactive({
    if(
      input$OffenseType == "White") {
      aggregate_edited$race
    } else {
      aggregate_edited$sex
    }
  })
  
  output$hist <- renderPlot({
    
    hist(x(),)
  })
  
  output$summary <- renderText({
    summary(x())
    
  })
}
