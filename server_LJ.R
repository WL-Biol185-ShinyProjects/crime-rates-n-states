library(shiny)
library(ggplot2)

# Bar : Offense by Race or Sex

function(input, output) { 
  x <- reactive({
    if(
      input$RaceSex == "Race") {
      aggregate_edited$race
    } else {
      aggregate_edited$sex
    }
  })
  
  output$bar <- renderPlot({
    
    ggplot(aggregate_edited, 
           aes_string(input$RaceSex, 'OffenseType') + 
           geom_bar() + 
           theme(legend.position = "top")
          )
                          })
  
    output$summary <- renderText({
      summary(x())
      
                          })
                       }



