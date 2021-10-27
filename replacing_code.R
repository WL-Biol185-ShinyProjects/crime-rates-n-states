library(ggplot2)
library(maps)
library(dplyr)
library(tidyverse)

percentagetable <- aggregate_edited %>%
  group_by(state_name, offense_type) %>%
  summarise(crimes = n()) %>%
  as.data.frame()

percentagetable <- aggregate_edited %>%
  group_by(state_name, offense_type) %>%
  summarise(crimes = n()) %>%
  as.data.frame()

table <- aggregate_edited %>%
  group_by(state_name, offense_type == "Shoplifting") %>%
  summarise(crimes = n()) %>%
  as.data.frame()

View(table)

## need to debug this
listofstates <- c('AL', 'AR', 'AZ', 'CO', 'CT', 'DC', 'DE', 'GA', 'HI', 'IA', 'ID', 'IL', 
                  'IN', 'KS', 'KY', 'LA', 'MA', 'MD', 'ME', 'MI', 'MN', 'MO', 'MS', 'MT', 
                  'NB', 'NC', 'ND', 'NH', 'NM', 'NV', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 
                  'SD', 'TN', 'TX', 'UT', 'VA', 'VT', 'WA', 'WI', 'WV', 'WY')

percentagetable$totalbystate <- aggregate_edited %>%
  group_by(state_name) %>%
  summarise(totalcrimes = n()) %>%
  View()
  
  

View(percentagetable)




ggplot(data   = aggregate_edited, 
       mapping = aes(x     = long, 
                     y     = lat, 
                     group = group, 
                     fill  = aggregate_edited$offense_type)) + 
  
  geom_polygon(color = "gray90",
             size = 0.1) + 
  
  coord_map(projection = "albers", 
            lato = 39, 
            lat1 = 45) + 
  
  labs(title = "Offense Type") + 
  
  labs(fill = "Percent") + 
  
  scale_fill_gradient(low = "white", 
                      high = "#CB454A")


  