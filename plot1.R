
setwd("C:/Users/Ricardo/Documents/Cursos/Big Data/Data Science - Exploratory Data Analisis/project2")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("C:/Users/Ricardo/Documents/Cursos/Big Data/Data Science - Exploratory Data Analisis/project2/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Ricardo/Documents/Cursos/Big Data/Data Science - Exploratory Data Analisis/project2/Source_Classification_Code.rds")

#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for 
#each of the years 1999, 2002, 2005, and 2008.

EmissionsTotalYear <- aggregate(Emissions ~ year, NEI, sum)

png(filename = "plot1.png")
barplot(height=EmissionsTotalYear$Emissions, names.arg=EmissionsTotalYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()
