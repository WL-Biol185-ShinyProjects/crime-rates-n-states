library(ggplot2)
library(maps)
library(dplyr)
library(tidyverse)
library(mapproj)


us_states <- map_data("state")
head(us_states)
dim(us_states)


ggplot(data   = us_states, 
       mapping = aes(x     = long, 
                     y     = lat, 
                     group = group, 
                     fill  = region)) + 
  
  geom_polygon(color = "gray90", size = 0.1) +
  coord_map(projection = "albers", lat0 = 39, lat1 = 45) +
  guides(fill = FALSE)

labs(title = "Offense Type") + 
  
  labs(fill = "Percent") + 
  
  scale_fill_gradient(low = "white", 
                      high = "#CB454A")















