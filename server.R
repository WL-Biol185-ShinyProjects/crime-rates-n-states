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
    
    state_map@data <-  left_join(state_map@data, summary_table, by = c("NAME" = "state_full_name"))
    
    if(input$crime_radio == "percent_of_shoplifting")
          {pal <- colorNumeric("Purples", NULL)}
    
    if(input$crime_radio == "percent_of_simple_assault")
          {pal <- colorNumeric("Reds", NULL)}
    
    if(input$crime_radio == "percent_of_drug_and_narcotic_violations")
          {pal <- colorNumeric("Greens", NULL)}
    
    if(input$crime_radio == "percent_of_burglary")
          {pal <- colorNumeric("Blues", NULL)}
    
    map <-
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
                title        = "Arrest Percentage",
                labFormat    = labelFormat(suffix = "%"))
                                })    
    
    output$demographic_bar <- renderPlot({

      count_df <- aggregate_edited %>% 
        group_by(sex, race, state_name) %>%
        count(offense_type) %>%
        filter(offense_type %in% !!input$offense_type)

      ggplot(data          = count_df, 
              aes_string(x = input$race_sex_state,
                         y = "n",
                         fill= input$race_sex_state
                        ))                                 +
        geom_bar(stat = "identity")                        +
        labs(y= "Number of Arrests", x= NULL, title= NULL) +
        theme_minimal()                                    + 
        theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.title = element_blank())
                                        }) 

  output$downloadData <- downloadHandler(

     filename = function() {
       paste("data", '.csv', sep='.')
                           },
     content = function(file) {
       write.csv(aggregate_edited, file)
                              }
                                        )
                         }
  
  
  