library(shiny)
library(ggplot2)
library(rgdal)
library(dplyr)
library(tidyverse)
library(leaflet)

state_map  <- rgdal::readOGR("states.geo.json")
summary_table <- read.csv("summary_table_folder/summary_table.csv")
aggregate_edited <- readRDS("individual_offense.RDS")

function(input, output) {
  
  output$crime_map <- renderLeaflet({
    #merge data frame into states
    state_map@data <-  left_join(state_map@data, summary_table, by = c("NAME" = "state_full_name"))

      pal <- colorNumeric("viridis", NULL)
    map<-
      leaflet(data = state_map) %>%
      setView(-96, 37.8, 4)%>%
      addTiles() %>%
      addPolygons(stroke = FALSE,
                  smoothFactor     = 0.3,
                  fillOpacity      = 0.6,
                  opacity          = 1,
                  dashArray        = "3",
                  weight           = 2,
                  color            = "white",
                  fillColor        = ~pal(state_map[[input$crime_radio]]),
                  label            = ~paste0(NAME, ": ", formatC(state_map[[input$crime_radio]])),
                  highlightOptions = highlightOptions(color = "white",
                                                      fillOpacity = 2,
                                                      bringToFront = TRUE
                  )) %>%
      addLegend("bottomright",
                pal          = pal,
                values       = ~(state_map[[input$crime_radio]]),
                opacity      = 0.8,
                title        = "Crime Percentage",
                labFormat    = labelFormat(suffix = "%"))
  })    

 
    
    # DEMOGRAPHICS creating bar graph
    
    output$demographic_bar <- renderPlot({
      
      #aggregate_edited_filtered <- aggregate_edited %>% 
       #filter (                   aggregate_edited$offense_type %in% 
                                     #input$OffenseType)
      
    # count <- aggregate_edited %>%
        #group_by(input$RaceSexState, input$OffenseType) %>%
        #summarise(input$OffenseType == n()) %>%
        #filter(offense_type == input$OffenseType)
      #count <- NULL # only show where it is TRUE to count
      
      #count_df <- aggregate_edited %>%
       # group_by(input$RaceSexState, offense_type) %>%
        #summarise(count = n())
      
      #hieu 
      #female <- aggregate_edited %>%
        #group_by(offense_type, sex) %>%
        #summarise(female_count = n()) %>%
        #filter(sex == "male")
      #female$sex <- NULL
      #View(female)
      
      #choosen_count <- count(aggregate_edited, input$OffenseType, input$RaceSexState)
      
      count_df <- aggregate_edited %>% 
        filter (aggregate_edited$offense_type %in% input$OffenseType) %>% 
        count(offense_type, input$RaceSexState)
      
      ggplot(    data= count_df, 
             aes(   x= input$RaceSexState, 
                    y= n)) +
        geom_bar(stat="identity")
      
      # theme(legend.position = "bottom")
      # sort from greatest to least
      # choose custom color
        #theme(legend.position = "bottom")
    })

#BIOGRAPHIES 
 
  observeEvent(input$natasha, {
    output$biographies <- renderText({ 
      "Natasha is a senior math major"
  })
              
  })
  observeEvent(input$leah, {
    output$biographies <- renderText({ 
      "Leah is a senior Biology major"
    })
    
  })
  observeEvent(input$hieu, {
    output$biographies <- renderText({ 
      "Hieu is a senior neuroscience major"
    })
  })
}
  