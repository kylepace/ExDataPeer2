plot1 <- function() {
	d <- readRDS('./data/summarySCC_PM25.rds')
	s <- tapply(d$Emissions, d$year, sum)
	labels <- names(s)
	png("plot1.png", 480, 480)
	barplot(s, names = labels, col = c("red", "blue", "green", "brown"), xlab = "Year", ylab = "Total PM 2.5 Emissions")
	dev.off()
}