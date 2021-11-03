library(shiny)
library(ggplot2)

function(input, output) { 
  x <- reactive({
    if(
      input$RaceSex == "Race") {
      aggregate_edited$race
    } else {
            if(
              input$RaceSex == "Race") {
        aggregate_edited$race
      } else {
        aggregate_edited$sex
      }
    }
  })
  
  aggregate_edited_filtered <- aggregate_edited %>% 
    filter (                   aggregate_Edited$offense_type %in% 
                               input$OffenseType)
  output$bar <- renderPlot({
    
    ggplot(data                  = aggregate_edited_filtered,
           aes_string( x         = input$RaceSex, 
                       fill      = 'OffenseType') + 
           geom_bar() + 
           theme(legend.position = "bottom")
          )
                          })
  
    output$summary <- renderText({
      summary(x())
                                })
                        }