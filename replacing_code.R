library(ggplot2)
library(maps)
library(dplyr)

#####
filenames <- list.files(pattern = ".csv")
readStateTables <- function(file){
  d <-read.csv(file)
  d$file <- file
  d
}

tables    <- lapply(filenames, readStateTables)
aggregate <- do.call(rbind, tables)
########

listofstates <- c('AL', 'AR', 'AZ', 'CO', 'CT', 'DC', 'DE', 'GA', 'HI', 'IA', 'ID', 'IL', 
                  'IN', 'KS', 'KY', 'LA', 'MA', 'MD', 'ME', 'MI', 'MN', 'MO', 'MS', 'MT', 
                  'NB', 'NC', 'ND', 'NH', 'NM', 'NV', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 
                  'SD', 'TN', 'TX', 'UT', 'VA', 'VT', 'WA', 'WI', 'WV', 'WY')

totalcasebystate <- function(file1){
  b <- length(aggregate_edited$state_name == file1)
  b$state <- file1
  b$totalcase <- b
  b
}

table1 <- lapply(listofstates, totalcasebystate)
newtable <- do.call(rbind, table1)
View(newtable)

ggplot(data   = aggregate_edited, 
       mapping = aes(x     = long, 
                     y     = lat, 
                     group = group, 
                     fill  = aggregate_edited$offense_type)) + 
  
  geom_polygon(color = "gray90",
             size = 0.1) + 
  
  coord_map(projection = "albers", 
            lato = 39, 
            lat1 = 45) + 
  
  labs(title = "Offense Type") + 
  
  labs(fill = "Percent") + 
  
  scale_fill_gradient(low = "white", 
                      high = "#CB454A")


  