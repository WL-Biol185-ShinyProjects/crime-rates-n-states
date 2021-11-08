library(shiny)
library(ggplot2)
library(rgdal)
library(dplyr)
library(tidyverse)
library(leaflet)

state_map  <- rgdal::readOGR("states.geo.json")
summary_table <- read.csv("summary_table_folder/summary_table.csv")
aggregate_edited <- read.csv("aggregate_edited_folder/aggregate_edited.csv")

function(input, output) {
  output$CrimeMap <- renderLeaflet({

    #merge data frame into states
    state_map@data <-  left_join(state_map@data, summary_table, by = c("NAME" = "state_full_name"))


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
                  fillColor        = ~pal(summary_table$percent_of_shoplifting),
                  label            = ~paste0(NAME, ": ", formatC(summary_table$percent_of_shoplifting)),
                  highlightOptions = highlightOptions(color = "white",
                                                      fillOpacity = 2,
                                                      bringToFront = TRUE
                  )) %>%
      addLegend("bottomright",
                pal          = pal,
                values       = ~(summary_table$percent_of_shoplifting),
                opacity      = 0.8,
                title        = "Does this work",
                labFormat    = labelFormat(suffix = "%"))
  })


  output$demographic_bar <- renderPlot(
    
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
    }),
    
    # DEMOGRAPHICS filter the data by the chosen offense
    aggregate_edited_filtered <- aggregate_edited %>% 
      filter (                   aggregate_edited$offense_type %in% 
                                   input$OffenseType),
    
    # DEMOGRAPHICS creating bar graph
    output$bar <- renderPlot({
      ggplot(data                  = aggregate_edited_filtered,
             aes_string( x         = input$RaceSexState)) +
        geom_bar() + 
        theme(legend.position = "bottom")
    })
    
  )


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
  