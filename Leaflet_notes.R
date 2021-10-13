# load leaflet
library(leaflet)
library(shiny)

# leaflet() %>%
  # set a default focus
  # setView(lng = -79.442778, lat = 37.783889, zoom = 12) %>%
  # an endless scroll of map from OpenStreetMaps
 # addTiles()
    # can add tiles from a bunch of different providers other than OpenStreetMaps (built into Leaflet)
    # use this code instead of addTiles():  addProviderTiles(provider = providers$NASAGIBS.ViirsEarthAtNight2012) 
    # (can select provider after typing $ to see all options)
    # to add tiles from a different provider, use this code:
      # addWMSTiles("http://mesonet.agron.iastate.edu/cgi-bin/wms/nexrad/n0r.cgi",
          # layers = "nexrad-n0r-900913",
          # options = WMSTileOptions(format = "image/png", transparent = TRUE),
          # attribution = "Weather data © 2012 IEM Nexrad"

# now i am going to add a marker for lab, class, and Napa Thai
# first, make a data frame
lex <- data.frame( lat    = c(37.789444 , 37.787673  ,  37.785624  )
                   , lon    = c(-79.441725, -79.443623 , -79.441544  )
                   , place  = c("Lab"     , "Classroom", "Thai food!")
                   , rating = c(7         , 5          , 10          )
                   , stringsAsFactors = FALSE
                )
# now bind this visualization to our data.frame

leaflet(data = lex) %>% 
  setView(lng = -79.442778, lat = 37.783889, zoom = 16) %>%
  addTiles()
  addMarkers(label = ~place, clusterOptions = markerClusterOptions())
  addCircleMarkers(radius = ~rating, label = ~place)



