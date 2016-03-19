plot6 <-  function(){
  
  ## Read input files
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  
  dev.new()
  
  # Segregate data for coal emission
  mobile <- subset(SCC, grepl("[Mm]obile", SCC.Level.One))
  
  #Filter Balitomre data and Los Angeles Data 
  s.bm <- subset(NEI, fips == "24510")
  s.la <- subset(NEI, fips == "06037")
  
  #Merge with NEI data set
  s.bm.mobile.merge <- merge(s.bm, mobile)
  s.la.mobile.merge <- merge(s.la, mobile)
  
  #Find sum of emission by year
  x.bm <- tapply(s.bm.mobile.merge$Emissions, as.factor(s.bm.mobile.merge$year), sum)
  x.la <- tapply(s.la.mobile.merge$Emissions, as.factor(s.la.mobile.merge$year), sum)
  
  # Plot trend
  par(mfrow=c(1,2))
  
  plot(names(x.bm), x.bm, col=names(x.bm), pch=19, type= "l", lwd=5,
       ylim = range(x.la, x.bm),
       xlab ="Year", 
       ylab="Mobile PM 2.5 Emmission (tonnes)",
       main = "Baltimore Trend")      
  
  plot(names(x.la), x.la, col=names(x.la), pch=19, type= "l", lwd=5,
       ylim = range(x.la, x.bm),
       xlab = "Year", 
       ylab = "Mobile PM 2.5 Emmission (tonnes)",
       main = "Los Angeles Trend")

  dev.copy(png, "plot6.png")
  dev.off()
}