#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
#Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question

library(ggplot2)
library(grDevices)
library(quantmod)
library(dplyr)

#Reading the data
NEI <- readRDS("summarySCC_PM25.rds")

number.add.width<-800                             # width length to make the changes faster
number.add.height<-800                             # height length to make the changes faster

#Emissions per year in Baltimore city and type
Balt.EmiPeryrTyp <- summarise(group_by(filter(NEI, fips=="24510"),type,year),Emissions = sum(Emissions))

#ggplot function

qplot(year, data = Balt.EmiPeryrTyp,weight=Emissions,geom = "bar",facets=.~type,color = type,fill = type,
      main='Baltimore City: Emissions (PM 2.5) per year and type',xlab='Years',ylab = 'Emissions (PM 2.5)')

#ggplot(Balt.EmiPeryrTyp,aes(x= factor(year),y = Emissions,fill = type ,label = round(Emissions,2)))+
  geom_bar(stat = "identity")+
  facet_grid(.~type)+
  xlab("Years")+ylab(expression("Total Emissions(PM 2.5)")+
  ggtitle(expression("Baltimore City: Emissions (PM 2.5) per year and type"))
  +geom_label(aes(fill = type),color = "white",fontface = "bold")                   
                     
  
  