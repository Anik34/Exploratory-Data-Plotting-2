NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

subsetNEI2 <- subset(NEI,fips=="06037")

roadsubset2 <- subset(subsetNEI2,type=="ON-ROAD")

roademissions2 <- aggregate(Emissions~year,roadsubset2,FUN=sum)

colorrange <- 6 :(length(roademissions2$year)+1)

library(ggplot2)

par(mfcol=c(1,2))

with(roademissions2,barplot(height = Emissions/1000,col=colorrange,
                             xlab = "Year",ylab = expression('PM'[2.5]*'in kilotons'),
                            main = expression(' Emission in Los Angeles ')))

with(roademissions,barplot(height = Emissions/1000,col=colorrange,
                            xlab = "Year",ylab = expression('PM'[2.5]*'in kilotons'),
                            main = expression(' Emission in Los Angeles ')))