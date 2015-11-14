require("jsonlite")
require("RCurl")
require("ggplot2")
require("extrafont")
# Change the USER and PASS below to be your UTEid
#df <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from RESPIRATORY_INFECTIONS"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_jmt3686', PASS='orcl_jmt3686', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))
setwd("/home/juanito/Google Drive/UT Austin/Classes Fall 2015/CS329E: Data Visualization/DV_TProject1/")

file_path <- "Gallups_Most_Important_Problem_reformatted.csv"

df <- read.csv(file_path, stringsAsFactors = FALSE)
head(df)

ggplot() +
  coord_cartesian() +
  scale_x_continuous() +
  scale_y_continuous() +
  labs(title="Popularity of different topics")
  layer(data=df,
        mapping=aes(x)
        
        
        )
#scatterplot
ggplot() + 
  coord_cartesian() + 
  scale_x_continuous() +
  scale_y_continuous() +
  #facet_wrap(~SURVIVED) +
  #facet_grid(DEATHS_1_TO_59_MONTHS), labeller=label_both) + # Same as facet_wrap but with a label.
  #facet_grid(PCLASS~SURVIVED, labeller=label_both) +
  labs(title='Death 1 to 59 months') +
  labs(x="Deaths", y=paste("Percentage")) +
  layer(data=df, 
        mapping=aes(x=as.numeric(as.character(AGE)), y=as.numeric(as.character(FARE)), color=SEX), 
        stat="identity", 
        stat_params=list(), 
        geom="point",
        geom_params=list(), 
        #position=position_identity()
        position=position_jitter(width=0.3, height=0)
  )

ggplot() + 
  coord_cartesian() + 
  scale_x_discrete() +
  scale_y_continuous() +
  #facet_grid(PCLASS~SURVIVED, labeller=label_both) +
  labs(title='Titanic') +
  labs(x="SURVIVED", y=paste("FARE")) +
  layer(data=df, 
        mapping=aes(x=SEX, y=as.numeric(as.character(FARE)), color=as.character(SURVIVED)), 
        stat="identity", 
        stat_params=list(), 
        geom="point",
        geom_params=list(), 
        #position=position_identity()
        position=position_jitter(width=0.3, height=0)
  )
