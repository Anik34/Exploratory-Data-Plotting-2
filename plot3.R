NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

subsetpoint <- subset(NEI,type="POINT")

subsetnonpoint <- subset(NEI,type="NONPOINT")

subsetonroad <- subset(NEI,type="ON-ROAD")

subsetnonroad <- subset(NEI,type="NON-ROAD")

library(ggplot2)

par(mfrow=c(2,2))

totalpointemissions <- aggregate(Emissions~year,subsetpoint,FUN = sum)

totalnonpointemissions <- aggregate(Emissions~year,subsetnonpoint,FUN = sum)

totalonroademissions <- aggregate(Emissions~year,subsetonroad,FUN = sum)

totalnonroademissions <- aggregate(Emissions~year,subsetnonroad,FUN = sum)

colorrange <- 2:(length(totalpointemissions$year)+1)

with(totalpointemissions,barplot(height = Emissions/1000,col=colorrange,
                                  xlab = "Year",ylab = expression('PM'[2.5]*'in kilotons'),
                                  main = expression('Annual point emission')))


with(totalnonpointemissions,barplot(height = Emissions/1000,col=colorrange,
                                 xlab = "Year",ylab = expression('PM'[2.5]*'in kilotons'),
                                 main = expression('Annual nonpoint emission')))

with(totalonroademissions,barplot(height = Emissions/1000,col=colorrange,
                                 xlab = "Year",ylab = expression('PM'[2.5]*'in kilotons'),
                                 main = expression('Annual onroad emission')))

with(totalnonroademissions,barplot(height = Emissions/1000,col=colorrange,
                                 xlab = "Year",ylab = expression('PM'[2.5]*'in kilotons'),
                                 main = expression('Annual nonroad emission')))


dev.copy(png,file="plot3.png")

dev.off()