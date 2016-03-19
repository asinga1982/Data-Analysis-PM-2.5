plot2 <- function(){
  
  ## Read input files
  NEI <- readRDS("summarySCC_PM25.rds")
  
  dev.new()
  
  # Extract subset with city as Baltimore
  s1 <- subset(NEI, fips == "24510")
  
  #Caluculate total emission by year
  x<- tapply(s1$Emissions, as.factor(as.character(s1$year)), sum)
  
  # Plot a line graph
  plot(names(x), x, col=names(x), pch=19, type= "l", xlab ="Year", 
             ylab="Total PM 2.5 Emmission Baltimore (tonnes)", lwd=5)
  
  
  dev.copy(png, "plot2.png")
  dev.off()
  
}