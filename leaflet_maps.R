library(tidyverse)
library(leaflet)
library(rgdal)
state_names<- read_csv("states.csv")
states_map  <- rgdal::readOGR("states_geo.json")

#merge data frame into states
states_map@data <- states_map %>%
  left_join(state_names) %>%
  left_join(final_table)

#usaStates <- usaStates %>%
#select(GEO_ID, STATE, NAME, LSAD, CENSUSAREA)

pal <- colorNumeric("YlOrRd", NULL)
map<-
  leaflet(data= statesGEO) %>%
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
            labFormat    = labelFormat(suffix = "%")) %>%
  View()