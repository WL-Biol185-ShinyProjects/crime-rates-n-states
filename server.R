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


function(input, output, session) {
  observeEvent(input$natasha, {
    output$selected_var <- renderText({ 
      "Natasha is a senior math major"
  })
              
  })
  observeEvent(input$leah, {
    output$selected_var <- renderText({ 
      "Leah is a senior biology major"
    })
    
  })
  observeEvent(input$hieu, {
    output$selected_var <- renderText({ 
      "Hieu is a senior neuroscience major"
    })
  })
}
  