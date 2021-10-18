filenames <- list.files(pattern = ".csv")
readStateTables <- function(file){
  d <-read.cvs(file)
  d$file <- file
  d
}

tables <- lapply(filenames, readStateTables)
aggregate <- do.call(rbind, tables)
aggregate