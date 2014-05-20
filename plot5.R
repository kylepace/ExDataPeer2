plot5 <- function() {
	d <- readRDS('./data/summarySCC_PM25.rds')
	balt <- d[d$fips == "24510" & d$type == "ON-ROAD", ]
	s <- tapply(balt$Emissions, balt$year, sum)
	labels <- names(s)
	png("plot5.png", 480, 480)
	barplot(s, names = labels, main = "Motor Vehicle Emissions in Baltimore City From 1999 - 2008", col = c("red", "blue", "green", "brown"), xlab = "Year", ylab = expression("Total " * PM[2.5] * " Emissions"))
	dev.off()
}