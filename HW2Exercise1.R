NEI <- readRDS("summarySCC_PM25.rds");
SCC <- readRDS("Source_Classification_Code.rds");
totEmission <- aggregate(NEI[, 'Emissions'], by=list(NEI$year), FUN=sum);
png(filename='HW2Exerciseplot1.png', width=480, height=480);
barplot(totEmission$x, names.arg=totEmission$Group.1, main=expression('Total Emission of PM'[2.5]),xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Tons')));
dev.off();