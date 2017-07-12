#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles 
#County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

library(ggplot2)
library(grDevices)
library(quantmod)
library(dplyr)
library(lubridate)

#Reading the data
NEI <- readRDS("summarySCC_PM25.rds")


Emiss.Mtr.Balti <- summarise(group_by(filter(NEI, fips == "24510" & type == "ON-ROAD"),year), Emissions = sum(Emissions))
Emiss.Mtr.Calf  <- summarise(group_by(filter(NEI, fips == "06037" & type == "ON-ROAD"),year), Emissions = sum(Emissions))  

#Adding counties

Emiss.Mtr.Balti$county <- "Baltimore City, MD"
Emiss.Mtr.Calf$county  <- "Los Angeless ,  CA"
#Emiss.Mtr.Balti  <- mutate(Emiss.Mtr.Balti, place = "Baltimore City")

#Combined Emissions

Both.Emissions <- rbind(Emiss.Mtr.Balti, Emiss.Mtr.Calf)

#Plot Function
ggplot(Both.Emissions, aes(x= factor(year), y = Emissions, fill = county))+
geom_bar(stat = "identity")+
facet_grid(county~.,scales = "free")+
xlab("Years")+
ylab(expression("Total Emissions PM(2.5) in tons"))+
ggtitle(expression("Motor vehicle emission variation in Baltimore and Los Angeles in tons"))+
#geom_label(aes(fill = County),colour = "white", fontface = "bold")
  
#qplot(year, data = Both.Emissions, weight = Emissions, fill = county, facets = .~ county, xlab = "Years", 
      ylab = "Total PM(2.5) Emissions in tons",main =  "Motor vehicle emission variation in Baltimore and Los Angeles in tons")  
  

