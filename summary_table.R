library(dplyr)
library(tidyverse)

source("individual_offense_table.R")

summary_df <- aggregate_edited %>%
  group_by(state_name, offense_type) %>%
  summarise(case = n()) 

shoplifting_case <- aggregate_edited %>%
  group_by(state_name, offense_type) %>%
  summarise(shoplifting = n()) %>%
  filter(offense_type == "Shoplifting")
shoplifting_case$offense_type <- NULL

simple_assault_case <- aggregate_edited %>%
  group_by(state_name, offense_type) %>%
  summarise(simple_assault = n()) %>%
  filter(offense_type == "Simple Assault")
simple_assault_case$offense_type <- NULL

drug_case <- aggregate_edited %>%
  group_by(state_name, offense_type) %>%
  summarise(drug_and_narcotic_violation = n()) %>%
  filter(offense_type == "Drug/Narcotic Violations")
drug_case$offense_type <- NULL

burglary <- aggregate_edited %>%
  group_by(state_name, offense_type) %>%
  summarise(burglary = n()) %>%
  filter(offense_type == "Burglary/Breaking & Entering")
burglary$offense_type <- NULL

total_crime_by_state <- aggregate_edited %>%
  group_by(state_name) %>%
  summarise(total_crimes = n())

shoplifting_table <- left_join(shoplifting_case, simple_assault_case)
drug_table <- left_join(shoplifting_table, drug_case)
burglary_table <- left_join(drug_table, burglary)
summary_table <- left_join(burglary_table, total_crime_by_state)
summary_table$percent_of_shoplifting <- summary_table$shoplifting *100 / summary_table$total_crimes
summary_table$percent_of_simple_assault <- summary_table$simple_assault *100 / summary_table$total_crimes
summary_table$percent_of_drug_and_narcotic_violations <- summary_table$drug_and_narcotic_violation *100 / summary_table$total_crimes
summary_table$percent_of_burglary <- summary_table$burglary *100 / summary_table$total_crimes

state_converter <- read.csv("states_converter/states_converter.csv")
state_full_name <- state_converter$State
names(state_full_name) <- state_converter$Abbreviation
summary_table$state_full_name <- state_full_name[as.character(summary_table$state_name)]

#write.csv(summary_table,"summary_table_folder/summary_table.csv", row.names = TRUE)





