NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

subsetNEI <- subset(NEI,fips =="24510")

totalannualemissions <- aggregate(Emissions~year,subsetNEI,FUN = sum)

colorrange <- 2:(length(totalannualemissions$year)+1)

with(totalannualemissions,barplot(height = Emissions/1000,col=colorrange,
                                  xlab = "Year",ylab = expression('PM'[2.5]*'in kilotons'),
                                  main = expression('Annual Emission PM'[2.5]*'from 1999 to 2008')))