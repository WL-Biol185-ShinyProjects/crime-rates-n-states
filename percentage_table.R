library(dplyr)
library(tidyverse)

shoplifting_case <- aggregate_edited %>%
  group_by(state_name, offense_type) %>%
  summarise(shoplifting = n()) %>%
  filter(offense_type == "Shoplifting")

total_crime_by_state <- aggregate_edited %>%
  group_by(state_name) %>%
  summarise(total_crimes = n())

percentage_table <- left_join(shoplifting_case, total_crime_by_state)
percentage_table$percent_of_shoplifting <- percentage_table$shoplifting / percentage_table$total_crimes
View(percentage_table)

