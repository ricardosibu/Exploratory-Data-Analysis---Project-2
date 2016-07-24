library(ggplot2)

setwd("C:/Users/Ricardo/Documents/Cursos/Big Data/Data Science - Exploratory Data Analisis/project2")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("C:/Users/Ricardo/Documents/Cursos/Big Data/Data Science - Exploratory Data Analisis/project2/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Ricardo/Documents/Cursos/Big Data/Data Science - Exploratory Data Analisis/project2/Source_Classification_Code.rds")

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
# vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

sub_NEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

EmissionsTotalYearAndFips <- aggregate(Emissions ~ year + fips, sub_NEI, sum)
EmissionsTotalYearAndFips$fips[EmissionsTotalYearAndFips$fips=="24510"] <- "Baltimore, MD"
EmissionsTotalYearAndFips$fips[EmissionsTotalYearAndFips$fips=="06037"] <- "Los Angeles, CA"

png('plot6.png')
g <- ggplot(EmissionsTotalYearAndFips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle in Baltimore City, MD vs Los Angeles, CA 1999-2008')
print(g)
dev.off()
