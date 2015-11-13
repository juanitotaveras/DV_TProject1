
df <- data.frame(fromJSON(getURL(URLencode('skipper.cs.utexas.edu:5001/rest/native/?query="select YEAR, MAJORTOPIC, PERCENTAGE from GALLUPS where (MAJORTOPIC = \\\'Macroeconomics\\\' or MAJORTOPIC = \\\'Defense\\\') and YEAR >= 2007;"'),httpheader=c(DB='jdbc:oracle:thin:@sayonara.microlab.cs.utexas.edu:1521:orcl', USER='C##cs329e_kdk745', PASS='orcl_kdk745', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))


df_1 <- df %>% mutate(KPI = ifelse(PERCENTAGE < 0.1, 'Low', ifelse(PERCENTAGE < 0.25, 'Moderate', 'High'))) 

ct <- ggplot(df_1, aes(MAJORTOPIC, YEAR)) + geom_tile(aes(fill = KPI)) + theme_bw() + xlab("") + ylab("") 
ct +  geom_text(aes(label = PERCENTAGE)) + labs(title = "Gallup Poll Crosstab") + theme(panel.grid.major = element_line(colour = "black")) + scale_fill_manual(values=c("#78C3FB", "#16E0BD", "#98838F"))

