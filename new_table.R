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

#renaming values as race names in a new column
  race <- c("Unknown", "White", "Black or African American", "American Indian or Alaska Native", "Asian", "Asian, Native Hawaiian, or Other Pacific Islander", "Chinese", "Japanese", "Native Hawaiian or Other Pacific Islander", "Other", "Multiple", "Not Specified") 

  names(race) <- c("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "98", "99")

  aggregate$race <- race[as.character(aggregate$RACE_ID)]


#replacing offender type data
  offense_type_id_key <- read.csv(NIBRS_OFFENSE_TYPE.CSV)

  offense_type <- offense_type_id_key$OFFENSE_NAME

  names(offense_type) <- offense_type_id_key$OFFENSE_TYPE_ID

  aggregate$offense_type <- offense_type[as.character(aggregate$OFFENSE_TYPE_ID)]



#replace sex code data
  sex <- c("Male", "Female")
  names(sex) <- c("M", "F")
  aggregate$sex <- sex[(aggregate$SEX_CODE)]
  
#replace resident code data
  resident <- c("Resident", "Non-resident")
  names(resident) <- c("R", "N")
  aggregate$resident <- resident[(aggregate$RESIDENT_CODE)]
  
  
#deleting more useless columns
  library(dplyr)
  aggregate_edited <- select(aggregate, -2, -3, -5, -6, -7, -8, -10, -11, -12, -13, -14)

  
  View(aggregate_edited)
  
