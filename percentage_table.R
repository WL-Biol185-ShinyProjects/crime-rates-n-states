library(dplyr)
library(tidyverse)

summary_df <- aggregate_edited %>%
  group_by(state_name, offense_type) %>%
  summarise(case = n()) 

shoplifting_case <- aggregate_edited %>%
  group_by(state_name, offense_type) %>%
  summarise(shoplifting = n()) %>%
  filter(offense_type == "Shoplifting")
shoplifting_case$offense_type <- NULL

simple_assult_case <- aggregate_edited %>%
  group_by(state_name, offense_type) %>%
  summarise(simple_assult = n()) %>%
  filter(offense_type == "Simple Assault")
simple_assult_case$offense_type <- NULL

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

table1 <- left_join(shoplifting_case, simple_assult_case)
table2 <- left_join(table1, drug_case)
table3 <- left_join(table2, burglary)
final_table <- left_join(table3, total_crime_by_state)
final_table$percent_of_shoplifting <- table4$shoplifting / table4$total_crimes
final_table$percent_of_simple_assult <- final_table$simple_assult / final_table$total_crimes
final_table$percent_of_drug_and_narcotic_violations <- final_table$drug_and_narcotic_violation / final_table$total_crimes
final_table$percent_of_burglary <- final_table$burglary / final_table$total_crimes

View(final_table)

