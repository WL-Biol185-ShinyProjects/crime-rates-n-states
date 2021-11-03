library(shiny)
library(ggplot2)

# DEMOGRAPHICS Race, Sex, or State options
function(input, output) { 
  x <- reactive({
    if(
      input$RaceSexState == "Race") {
      aggregate_edited$race
    } else {
      if(
        input$RaceSexState == "Sex") {
        aggregate_edited$sex
      } else {
        aggregate_edited$state_name
      }
    }
  })
  
  # DEMOGRAPHICS filter the data by the chosen offense
  aggregate_edited_filtered <- aggregate_edited %>% 
    filter (                   aggregate_edited$offense_type %in% 
                                 input$OffenseType)
  
  # DEMOGRAPHICS creating bar graph
  output$bar <- renderPlot({
    ggplot(data                  = aggregate_edited_filtered,
           aes_string( x         = input$RaceSexState)) +
      geom_bar() + 
      theme(legend.position = "bottom")
  })
  
  output$summary <- renderText({
    summary(x())
  })
}