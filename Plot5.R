#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

library(ggplot2)
library(grDevices)
library(quantmod)
library(dplyr)
library(lubridate)

#Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

BaltMtrEmiss <- NEI[(NEI$fips == "24510") & (NEI$type == "ON-ROAD"),]
                
#BaltMtrEmiss <- subset(NEI, fips == "24150" & type == "ON-ROAD")
BaltEmissMtrPrYr <- summarize(group_by(BaltMtrEmiss,year), Emissions = sum(Emissions))

#Plotting
ggplot(BaltEmissMtrPrYr, aes(x = factor(year), y = Emissions, fill = year,label = round(Emissions,2)))+
geom_bar(stat = "identity")+
xlab("Years")+ 
ylab(expression("Total pm25 emissions in kilotons"))+
ggtitle("Emissions from motor vehicle sources in Baltimore City")
#+geom_label(aes(fill = year),colour = "white", fontface = "bold")



