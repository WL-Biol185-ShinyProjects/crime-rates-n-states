library(shiny)
library(ggplot2)
#library(maps)
#library(dplyr)
#library(tidyverse)
library(leaflet)

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

#BIOGRAPHIES 
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
  