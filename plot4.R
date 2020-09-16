NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal <- grepl("coal",SCC$SCC.Level.Four,ignore.case = TRUE)

subsetcoal <- SCC[coal,]

NEISCC <- merge(NEI,subsetcoal,by="SCC")

aggregatedTotalByYear <- aggregate(Emissions ~ year, NEISCC, sum)

library(ggplot2)

par(mfrow=c(1,1))

with(aggregatedTotalByYear,barplot(height = Emissions/1000,col=colorrange,
                                   +                                    xlab = "Year",ylab = expression('PM'[2.5]*'in kilotons'),
                                   +                                    main = expression('Annual Coal Related Emission')))