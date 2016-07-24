setwd("C:/Users/Ricardo/Documents/Cursos/Big Data/Data Science - Exploratory Data Analisis/project2")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("C:/Users/Ricardo/Documents/Cursos/Big Data/Data Science - Exploratory Data Analisis/project2/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Ricardo/Documents/Cursos/Big Data/Data Science - Exploratory Data Analisis/project2/Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

sub_NEI  <- NEI[NEI$fips=="24510", ]

EmissionsTotalYear <- aggregate(Emissions ~ year, sub_NEI, sum)

png('plot2.png')
barplot(height=EmissionsTotalYear$Emissions, names.arg=EmissionsTotalYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total Emission in Baltimore City, MD'))
dev.off()
