plot3 <- function() {
	require(ggplot2)
	d <- readRDS('./data/summarySCC_PM25.rds')
	balt <- d[d$fips == "24510", ]
	byType <- aggregate(balt$Emissions, list(year = balt$year, type = balt$type), sum)
	png("plot3.png", 480, 480)
	print(ggplot(byType, aes(year, x, fill = factor(year)))
		  + geom_bar(stat = "identity") 
		  + facet_wrap(~ type)
		  + labs(title = expression("Baltimore City Total Emissions By Type in " * PM[2.5]))
		  + labs(x = "Year", y = expression("Total " * PM[2.5]))
		  + scale_x_continuous(breaks = c(1999, 2002, 2005, 2008)))
	dev.off()
}