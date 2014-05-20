plot2 <- function() {
	d <- readRDS('./data/summarySCC_PM25.rds')
	balt <- d[d$fips == "24510", ]
	s <- tapply(balt$Emissions, balt$year, sum)
	labels <- names(s)
	png("plot2.png", 480, 480)
	barplot(s, names = labels, main = "Baltimore Total Emissions", col = c("red", "blue", "green", "brown"), xlab = "Year", ylab = "Total PM 2.5 Emissions")
	dev.off()
}