# crime-rates-n-states


This is an interactive guide of crime rates and other features between states, as reported to the National Incident-Based Reporting System (NIBRS), the FBI's newest crime reporting system. 


filenames <- list.files(pattern = ".csv")
readStateTables <- function(file){
  d <-read.cvs(file)
  d$file <- file
  d
}

tables <- lapply(filenames, readStateTables)
aggregate <- do.call(rbind, tables)
aggregate