library(ggplot2)
library(maps)
library(dplyr)
library(tidyverse)

table <- aggregate_edited %>%
  group_by(state_name, offense_type) %>%
  summarise(shoplifting = n()) %>%
  filter(offense_type == "Shoplifting")
 
totalcrimebystate <- aggregate_edited %>%
  group_by(state_name) %>%
  summarise(totalcrimes = n())

newtable <- left_join(table, totalcrimebystate)
newtable$percentofshoplifting <- newtable$shoplifting / newtable$totalcrimes
View(newtable)

## need to debug this
listofstates <- c('AL', 'AR', 'AZ', 'CO', 'CT', 'DC', 'DE', 'GA', 'HI', 'IA', 'ID', 'IL', 
                  'IN', 'KS', 'KY', 'LA', 'MA', 'MD', 'ME', 'MI', 'MN', 'MO', 'MS', 'MT', 
                  'NB', 'NC', 'ND', 'NH', 'NM', 'NV', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 
                  'SD', 'TN', 'TX', 'UT', 'VA', 'VT', 'WA', 'WI', 'WV', 'WY')

ggplot(data   = newtable, 
       mapping = aes(x     = 'long', 
                     y     = 'lat', 
                     group = 'group', 
                     fill  = newtable$percentofshoplifting)) + 
  
  geom_polygon(color = "gray90",
             size = 0.1) + 
  
  coord_map(projection = "albers", 
            lato = 39, 
            lat1 = 45) + 
  
  labs(title = "Offense Type") + 
  
  labs(fill = "Percent") + 
  
  scale_fill_gradient(low = "white", 
                      high = "#CB454A")


  