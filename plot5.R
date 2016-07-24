library(ggplot2)

setwd("C:/Users/Ricardo/Documents/Cursos/Big Data/Data Science - Exploratory Data Analisis/project2")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("C:/Users/Ricardo/Documents/Cursos/Big Data/Data Science - Exploratory Data Analisis/project2/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Ricardo/Documents/Cursos/Big Data/Data Science - Exploratory Data Analisis/project2/Source_Classification_Code.rds")

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

sub_NEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

EmissionsTotalYear <- aggregate(Emissions ~ year, sub_NEI, sum)



png('plot5.png')
g <- ggplot(EmissionsTotalYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle in Baltimore City, Maryland')
print(g)
dev.off()
