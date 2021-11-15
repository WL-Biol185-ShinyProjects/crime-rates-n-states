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
  
 observeEvent(input$shoplifting, {
   
  output$crime_map <- renderLeaflet({

    #merge data frame into states
    state_map@data <-  left_join(state_map@data, summary_table, by = c("NAME" = "state_full_name"))


    pal <- colorNumeric("Purples", NULL)
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
                  fillColor        = ~pal(state_map$percent_of_shoplifting),
                  label            = ~paste0(NAME, ": ", formatC(state_map$percent_of_shoplifting)),
                  highlightOptions = highlightOptions(color = "white",
                                                      fillOpacity = 2,
                                                      bringToFront = TRUE
                  )) %>%
      addLegend("bottomright",
                pal          = pal,
                values       = ~(state_map$percent_of_shoplifting),
                opacity      = 0.8,
                title        = "Shoplifting Percentage",
                labFormat    = labelFormat(suffix = "%"))
  })
 }
 )
  
  observeEvent(input$simple_assault, {
    
    output$crime_map <- renderLeaflet({
      
      #merge data frame into states
      state_map@data <-  left_join(state_map@data, summary_table, by = c("NAME" = "state_full_name"))
      
      
      pal <- colorNumeric("Reds", NULL)
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
                    fillColor        = ~pal(state_map$percent_of_simple_assault),
                    label            = ~paste0(NAME, ": ", formatC(state_map$percent_of_simple_assault)),
                    highlightOptions = highlightOptions(color = "white",
                                                        fillOpacity = 2,
                                                        bringToFront = TRUE
                    )) %>%
        addLegend("bottomright",
                  pal          = pal,
                  values       = ~(state_map$percent_of_simple_assault),
                  opacity      = 0.8,
                  title        = "Simple Assault Percentage",
                  labFormat    = labelFormat(suffix = "%"))
    })
  }
  )
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
      
      count_df <- aggregate_edited %>%
        group_by(input$RaceSexState, offense_type) %>%
        summarise(count = n())
      
      ggplot(data                  = count_df,
             aes_string(x          = input$RaceSexState,
                        y          = count)) +
        geom_bar(stat = "identity") 
      
      # theme(legend.position = "bottom")
      # sort from greatest to least
      # choose custom color
      
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
  