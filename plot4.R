plot4 <- function() {
	d <- readRDS('./data/summarySCC_PM25.rds')
	scc <- readRDS('./data/Source_Classification_Code.rds')
	
	com <- grep("combustion", x = scc$SCC.Level.One, ignore.case = TRUE)
	coal <- grep("coal", x = SCC$SCC.Level.Three, ignore.case = TRUE)
	coalCom <- intersect(coal, com)
	onlyCoalCombustion <- scc[coalCom, ]
	onlycc <- merge(d, onlyCoalCombustion, by = "SCC")
	
	s <- tapply(onlycc$Emissions, onlycc$year, sum)
	labels <- names(s)
	png("plot4.png", 480, 480)
	barplot(s, names = labels, main = "Coal Combustion Emissions From 1999 - 2008", col = c("red", "blue", "green", "brown"), xlab = "Year", ylab = expression("Total " * PM[2.5] * " Emissions"))
	dev.off()
}