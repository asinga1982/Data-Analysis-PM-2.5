plot1 <- function(){
  
  ## REading input files
  ## This first line will likely take a few seconds. Be patient!
  NEI <- readRDS("summarySCC_PM25.rds")
  #SCC <- readRDS("Source_Classification_Code.rds")
  dev.new()
  
  # Calculate total emission by year
  x<- tapply(NEI$Emissions, as.factor(as.character(NEI$year)), sum)
  
  #Plot the trend as line graph
  plot(names(x), x, col=names(x), pch=19, type= "l", xlab ="Year", 
       ylab="Total PM 2.5 Emmission (tonnes)", lwd=5)
  
  dev.copy(png, "plot1.png")
  dev.off()
}
  