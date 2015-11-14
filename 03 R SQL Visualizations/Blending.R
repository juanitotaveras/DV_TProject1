require("jsonlite")
require("RCurl")
require("ggplot2")
require("extrafont")
# Change the USER and PASS below to be your UTEid
df <- data.frame(fromJSON(getURL(URLencode('skipper.cs.utexas.edu:5001/rest/native/?query="SELECT Year, Majortopic FROM GALLUPS WHERE ((MAJORTOPIC=\\\'Civil Rights\\\' OR MAJORTOPIC=\\\'Crime\\\' OR MAJORTOPIC=\\\'Education\\\' OR MAJORTOPIC = \\\'Health\\\' OR MAJORTOPIC=\\\'Social Welfare\\\') AND (YEAR > 1960)) UNION ALL SELECT Year, Majortopic FROM GALLUPS WHERE ((MAJORTOPIC=\\\'Civil Rights\\\' OR MAJORTOPIC=\\\'Crime\\\' OR MAJORTOPIC=\\\'Education\\\' OR MAJORTOPIC = \\\'Health\\\' OR MAJORTOPIC=\\\'Social Welfare\\\') AND (YEAR > 1960)) ORDER BY YEAR;"'),httpheader=c(DB='jdbc:oracle:thin:@sayonara.microlab.cs.utexas.edu:1521:orcl', USER='C##cs329e_kdk745', PASS='orcl_kdk745', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))


tbl_df(df)


