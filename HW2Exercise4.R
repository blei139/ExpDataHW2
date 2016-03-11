NEI <- readRDS("summarySCC_PM25.rds");
SCC <- readRDS("Source_Classification_Code.rds");
coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),];
head(coal$SCC);
head(NEI$SCC);
SCCmrg <- merge(x = NEI, y = coal, by = "SCC");
totEmission <- aggregate(SCCmrg[, 'Emissions'], by=list(SCCmrg$year), FUN=sum);
png(filename='HW2Exerciseplot4.png', width=480, height=480);
barplot(totEmission$x, names.arg=totEmission$Group.1, main=expression('Total Emission of PM'[2.5]),xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Tons')));
dev.off()