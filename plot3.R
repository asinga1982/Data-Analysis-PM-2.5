plot3 <- function(){
  
  ## Read input files
  NEI <- readRDS("summarySCC_PM25.rds")
  
  #dev.new()
  
  #Subset Baltimore city
  s1 <- subset(NEI, fips == "24510")
  
  # create levels
  ind <- list(as.factor(s1$year), as.factor(s1$type))
  
  #Caluculate total Emission by year and type
  x1 <- tapply(s1$Emissions, ind, sum)
  
  #Covert into a dataframe
  x <- stack(as.data.frame(x1))
  x$year <- c("1999", "2002", "2005", "2008")
  
  #Plot graph of emission across year and type
  ggplot( data=x, aes(year, values, group=1)) + 
    geom_line(lwd=1, col="red") + facet_grid(.~ind) +
    xlab("Year") + ylab("PM 2.5 Emission (Tonnes)")
  
  ggsave("plot3.png")
  
   }