
#replacing offender type data
  offense_type_id_key <- read.csv(NIBRS_OFFENSE_TYPE.CSV)

  offense_type <- offense_type_id_key$OFFENSE_NAME
  
  names(offense_type) <- offense_type_id_key$OFFENSE_TYPE_ID

  aggregate$offense_type <- offense_type[as.character(aggregate$OFFENSE_TYPE_ID)]

  View(aggregate)
  
#replace sex code data
  
  


