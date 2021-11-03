library(tidyverse)
library(leaflet)
library(rgdal)
state_map  <- rgdal::readOGR("states.geo.json")

#merge data frame into states
state_map@data <-  left_join(state_map@data, final_table, by = c("NAME" = "State"))


















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