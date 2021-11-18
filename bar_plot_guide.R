library(shiny)
library(ggplot2)
library(dplyr)
library(tidyverse)


aggregate_edited <- readRDS("individual_offense.RDS")

  count_df1000 <- aggregate_edited %>% 
    filter (                   aggregate_edited$offense_type %in% "Shoplifting") %>% 
    count(offense_type, sex, state_name, race, sort=TRUE)
  View(count_df1000)
  
  
  count_df1 <- aggregate_edited %>% 
    filter (                   aggregate_edited$offense_type %in% "Aggravated Assault") %>% 
    count(offense_type, sex, sort=TRUE)
  View(count_df1)
  
  
  ggplot(data=count_df1, aes(x=sex, y=n)) +
    geom_bar(stat="identity")
  
  count_df1 <- aggregate_edited %>% 
    filter (aggregate_edited$offense_type %in% "Aggravated Assault") %>% 
    count(offense_type, sex)
  
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
  
  
  
  #aggregate_edited_filtered <- aggregate_edited %>% 
  #filter (                   aggregate_edited$offense_type %in% 
  #input$OffenseType)
  
  # count <- aggregate_edited %>%
  #group_by(input$RaceSexState, input$OffenseType) %>%
  #summarise(input$OffenseType == n()) %>%
  #filter(offense_type == input$OffenseType)
  #count <- NULL # only show where it is TRUE to count
  
  #count_df <- aggregate_edited %>%
  # group_by(input$RaceSexState, offense_type) %>%
  #summarise(count = n())
  
  #hieu 
  #female <- aggregate_edited %>%
  #group_by(offense_type, sex) %>%
  #summarise(female_count = n()) %>%
  #filter(sex == "male")
  #female$sex <- NULL
  #View(female)
  
  #choosen_count <- count(aggregate_edited, input$OffenseType, input$RaceSexState)
  
  
  
  
  count_df8 <- aggregate_edited %>% 
    group_by(aggregate_edited$sex, aggregate_edited$race, aggregate_edited$state_name) %>%
    count(aggregate_edited$offense_type) %>%
    filter(aggregate_edited$offense_type %in% input$OffenseType)
  