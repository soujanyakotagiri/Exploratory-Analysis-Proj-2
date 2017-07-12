#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a 
#plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
library(ggplot2)
library(grDevices)
library(quantmod)
library(dplyr)

#Reading the data
NEI <- readRDS("summarySCC_PM25.rds")

# Table with emissions per year
EmissionsPerYr <- summarize(group_by(NEI, year), Emissions=sum(Emissions))
#EmissionsPerYr <- With(NEI,aggregate(Emissions,by = list(year),sum))

#Using Plot function
#Naming the plot
#png("plot1.png")

barplot(height=EmissionsPerYr$Emissions/1000, names.arg=EmissionsPerYr$year,
        xlab="years", ylab=expression('total PM'[2.5]*' emission in kilotons'),ylim=c(0,8000),
        main=expression('Total PM'[2.5]*' emissions at various years in kilotons'),col= "blue")

#Saving the plot
#dev.off()
#dev.cur()
#dev.list()
  
 