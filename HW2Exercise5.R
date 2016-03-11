NEI <- readRDS("summarySCC_PM25.rds");
SCC <- readRDS("Source_Classification_Code.rds");
vehicle = SCC[grepl("vehicle", SCC$Short.Name, ignore.case=TRUE),];
head(vehicle$SCC);
head(NEI$SCC);
SCCmrg <- merge(x = NEI, y = vehicle, by = "SCC");
totEmission <- aggregate(SCCmrg[, 'Emissions'], by=list(SCCmrg$year, SCCmrg$fips == "24510", SCCmrg$type == "ON-ROAD"), FUN=sum);
totEmission <- subset(totEmission, Group.2 == TRUE);
totEmission <- subset(totEmission, Group.3 == TRUE);
png(filename='HW2Exerciseplot5.png', width=480, height=480);
barplot(totEmission$x, names.arg=totEmission$Group.1, main=expression(paste('Total ON-ROAD Vehicle Emission of PM',''[2.5], 'In Baltimore, Maryland')),xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Tons')));
dev.off()