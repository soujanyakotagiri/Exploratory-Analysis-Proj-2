#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.

library(ggplot2)
library(grDevices)
library(quantmod)
library(dplyr)

#Reading the data
NEI <- readRDS("summarySCC_PM25.rds")

number.add.width<-800                             # width length to make the changes faster
number.add.height<-800                             # height length to make the changes faster

# Table with emissions per year in Baltimore city
BaltiEmisPeryr <- summarise(group_by(filter(NEI, fips == "24510"), year), Emissions = sum(Emissions))

#Plot Function

#Naming the plot
png("plot1.png")

colrs = c("blue","green","pink","yellow")
barplot(height = BaltiEmisPeryr$Emissions, names.arg = BaltiEmisPeryr$year,xlab = "years",ylab = expression('total PM'[2.5]*' emission in kilotons'),
        ylim=c(0,4000),main=expression('Total PM'[2.5]*' emissions in Baltimore City-MD in kilotons'),col = colrs)
dev.off()


