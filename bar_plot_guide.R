library(shiny)
library(ggplot2)
library(dplyr)
library(tidyverse)


aggregate_edited <- readRDS("individual_offense.RDS")

  count_df <- aggregate_edited %>% 
    filter (                   aggregate_edited$offense_type %in% "Shoplifting") %>% 
    count(offense_type, sex, state_name, race, sort=TRUE)
  View(count_df)
  
  
  count_df1 <- aggregate_edited %>% 
    filter (                   aggregate_edited$offense_type %in% "Aggravated Assault") %>% 
    count(offense_type, sex, sort=TRUE)
  View(count_df1)
  
  
  ggplot(data=count_df1, aes(x=sex, y=n)) +
    geom_bar(stat="identity")
  
  count_df2 <- aggregate_edited %>% 
    filter (                   aggregate_edited$offense_type %in% "Aggravated Assault") %>% 
    count(offense_type, state_name, sort=TRUE)
  View(count_df2)
  
  ggplot(data=count_df2, aes(x=state_name, y=n)) +
    geom_bar(stat="identity")
  
  count_df3 <- aggregate_edited %>% 
    filter (                   aggregate_edited$offense_type %in% "Aggravated Assault") %>% 
    count(offense_type, race, sort=TRUE)
  View(count_df3)
  
  ggplot(data=count_df3, aes(x=race, y=n)) +
    geom_bar(stat="identity")
  