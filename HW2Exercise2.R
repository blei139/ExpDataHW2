NEI <- readRDS("summarySCC_PM25.rds");
SCC <- readRDS("Source_Classification_Code.rds");
totEmission <- aggregate(NEI[, 'Emissions'], by=list(NEI$year, NEI$fips == "24510"), FUN=sum);
totEmission <- subset(totEmission, Group.2 == TRUE);
png(filename='HW2Exerciseplot2.png', width=480, height=480);
barplot(totEmission$x, names.arg=totEmission$Group.1, main=expression(paste('Total Emission of PM', ''[2.5], ' In Baltimore, Maryland')),xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Tons')));
dev.off();