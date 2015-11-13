require(tidyr)
require(dplyr)
require(ggplot2)
require(lubridate)

setwd("/home/juanito/Desktop/data_online/DV_TProject1")

file_path <- "Public_Laws_reformatted.csv"

df <- read.csv(file_path, stringsAsFactors = FALSE)

measures <- c("PublicLawNo", "Year", "Congress", "Democrat", "HouseCommittee", "SenateCommittee", "subTopicCode", "DateIntroduced", "DataPassedHouse", "DatePassedSenate", "DateSigned")

# Get rid of special characters in each column.
for(n in names(df)) {
  df[n] <- data.frame(lapply(df[n], gsub, pattern="[^ -~]",replacement= ""))
}

dimensions <- setdiff(names(df), measures)

#tableName <- gsub(" +", "_", gsub("[^A-z, 0-9, ]", "", gsub(".csv", "", file_path)))
sql <- paste("CREATE TABLE", "PUBLIC_LAWS (\n")
if( length(measures) > 1 || ! is.na(dimensions)) {
  for(d in dimensions) {
    sql <- paste(sql, paste(d, "varchar2(4000),\n"))
  }
}
if( length(measures) > 1 || ! is.na(measures)) {
  for(m in measures) {
    if(m != tail(measures, n=1)) sql <- paste(sql, paste(m, "number(38,4),\n"))
    else sql <- paste(sql, paste(m, "number(38,4)\n"))
  }
}
sql <- paste(sql, ");")
cat(sql)
