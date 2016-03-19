plot4 <- function(){
  
  ## Read input files
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  
  dev.new()
  
  # Segregate data for coal emission
  coal <- subset(SCC, grepl("[Cc]oal", SCC.Level.Three))
  
  #Merge with NEI data set
  coal.merge <- merge(NEI, coal)
  
  #Find sum of emission by year
  x <- tapply(coal.merge$Emissions, as.factor(coal.merge$year), sum)
  
  # Plot trend
  plot(names(x), x, col=names(x), pch=19, type= "l", xlab ="Year", 
             ylab="Coal PM 2.5 Emmission (tonnes)", lwd=5)
   
  
  dev.copy(png, "plot4.png")
  dev.off()
}