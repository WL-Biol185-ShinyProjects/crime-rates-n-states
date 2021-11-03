library(shiny)
library(ggplot2)
library(rgdal)
library(dplyr)
library(tidyverse)
library(leaflet)

state_map  <- rgdal::readOGR("states.geo.json")
source("percentage_table.R")

function(input, output) {
  output$CrimeMap <- renderLeaflet({

    #merge data frame into states
    state_map@data <-  left_join(state_map@data, final_table, by = c("NAME" = "state_full_name"))


    pal <- colorNumeric("YlOrRd", NULL)
    map<-
      leaflet(data= state_map) %>%
      setView(-96, 37.8, 4)%>%
      addTiles() %>%
      addPolygons(stroke = FALSE,
                  smoothFactor     = 0.3,
                  fillOpacity      = 0.7,
                  opacity          = 1,
                  dashArray        = "3",
                  weight           = 2,
                  color            = "white",
                  fillColor        = ~pal(final_table$percent_of_shoplifting),
                  label            = ~paste0(NAME, ": ", formatC(final_table$percent_of_shoplifting)),
                  highlightOptions = highlightOptions(color = "white",
                                                      fillOpacity = 2,
                                                      bringToFront = TRUE
                  )) %>%
      addLegend("bottomright",
                pal          = pal,
                values       = ~(final_table$percent_of_shoplifting),
                opacity      = 0.8,
                title        = "Does this work",
                labFormat    = labelFormat(suffix = "%"))
  })
}



#function(input, output) { 
 # x <- reactive({
  #  if(
   #   input$RaceSex == "Race") {
    #  aggregate_edited$race
  #  } else {
   #   aggregate_edited$sex
  #  }
#  })
  
 # aggregate_edited_filtered <- aggregate_edited %>% 
  #  filter (                   aggregate_Edited$offense_type %in% 
  #                               input$OffenseType)
  #output$bar <- renderPlot({
    
   # ggplot(data                  = aggregate_edited_filtered,
    #       aes_string( x         = input$RaceSex, 
     #                  fill      = 'OffenseType') + 
      #       geom_bar() + 
       #      theme(legend.position = "bottom")
  #  )
  #})
  
 # output$summary <- renderText({
  #  summary(x())
  #})
#}

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
  