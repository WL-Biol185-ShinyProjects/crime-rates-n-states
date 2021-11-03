library(shiny)
library(ggplot2)
#library(maps)
#library(dplyr)
#library(tidyverse)
library(leaflet)

function(input, output) { 
  x <- reactive({
    if(
      input$RaceSex == "Race") {
      aggregate_edited$race
    } else {
      aggregate_edited$sex
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

function(input, output, session) {
  observeEvent(input$natasha, {
    output$selected_var <- renderText({ 
      "Natasha is a senior math major"
  })
              
  })
  observeEvent(input$leah, {
    output$selected_var <- renderText({ 
      "Leah is a senior Biology major"
    })
    
  })
  observeEvent(input$hieu, {
    output$selected_var <- renderText({ 
      "Hieu is a senior neuroscience major"
    })
  })
}
  