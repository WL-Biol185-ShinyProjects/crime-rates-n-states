key <- read.csv("NIBRS_OFFENSE_TYPE.CSV")
key

arrest_type <- key$OFFENSE_NAME
names(arrest_type) <- key$OFFENSE_TYPE_ID
arrest_type[1]

aggregate$ARREST_TYPE <- 