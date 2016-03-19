plot5 <- function() {
  
  ## Read input files
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  
  dev.new()
  
  
  # Segregate data for coal emission
  mobile <- subset(SCC, grepl("[Mm]obile", SCC.Level.One))
  
  #Filter Balitomre data
  s1 <- subset(NEI, fips == "24510")
  
  #Merge with NEI data set
  mobile.merge <- merge(s1, mobile)
  
  #Find sum of emission by year
  x <- tapply(mobile.merge$Emissions, as.factor(mobile.merge$year), sum)
  
  # Plot trend
  plot(names(x), x, col=names(x), pch=19, type= "l", lwd=5,
       xlab ="Year", 
       ylab="Baltimore Mobile PM 2.5 Emmission (tonnes)")
  
  dev.copy(png, "plot5.png")
  dev.off()
}