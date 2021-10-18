filenames <- list.files(pattern = ".csv")
readStateTables <- function(file){
  d <-read.csv(file)
  d$file <- file
  d
}

tables <- lapply(filenames, readStateTables)
aggregate <- do.call(rbind, tables)
aggregate


# added a column with state names
aggregate$state_name <- substr(aggregate$file, 16, 17)

# deleted useless columns: incident id, clearance, age_range_low (same as age), age_range_high (always 0), file name
library(dplyr)
aggregate <- select(aggregate, -3, -16, -18, -19)
aggregate <- select(aggregate, -15)

# made a table with a key for the offense ID type
offense_type_id_key <- read.csv("NIBRS_OFFENSE_TYPE.CSV")
View(offense_type_id_key)



