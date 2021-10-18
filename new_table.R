filenames <- list.files(pattern = ".csv")
readStateTables <- function(file){
  d <-read.csv(file)
  d$file <- file
  d
}

tables <- lapply(filenames, readStateTables)
aggregate <- do.call(rbind, tables)
aggregate

aggregate$state_name <- substr(aggregate$file, 16, 17)

