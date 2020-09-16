NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

subsetNEI <- subset(NEI,fips =="24510")

roadsubset <- subset(subsetNEI,type=="ON-ROAD")

roademissions <- aggregate(Emissions~year,roadsubset,FUN=sum)

colorrange <- 1: (length(roademissions$year)+1)

with(roademissions,barplot(height = Emissions/1000,col=colorrange,
                           +                                   xlab = "Year",ylab = expression('PM'[2.5]*'in kilotons'),
                           +                                   main = expression('Annual Emission in Baltimore City from Motor Vehicle')))