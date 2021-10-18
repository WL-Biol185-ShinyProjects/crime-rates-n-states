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

NIBRS_ARRESTEE_AL <- read.csv("~/crime-rates-n-states/NIBRS_ARRESTEE_AL.csv")
a <- c("Unknown", "White", "Black or African American", "American Indian or Alaska Native", "Asian", "Asian, Native Hawaiian, or Other Pacific Islander", "Chinese", "Japanese", "Native Hawaiian or Other Pacific Islander", "Other", "Multiple", "Not Specified") 
names(a) <- c("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "98", "99")
a[as.character(c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 98, 99))]
NIBRS_ARRESTEE_AL$RACE <- as.character(NIBRS_ARRESTEE_AL$RACE_ID)
NIBRS_ARRESTEE_AL$RACE <- a[NIBRS_ARRESTEE_AL$RACE_ID]
View(NIBRS_ARRESTEE_AL)