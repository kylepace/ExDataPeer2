plot6 <- function() {
	require(ggplot2)
	d <- readRDS('./data/summarySCC_PM25.rds')
	cities <- d[(d$fips == "24510" | d$fips == "06037") & d$type == "ON-ROAD", ]
	cities$city <- ifelse(cities$fips == "06037", "LA", "Baltimore")
	byCity <- aggregate(cities$Emissions, list(year = cities$year, city = cities$city), sum)
	
	png("plot6.png", 480, 480)
	print(ggplot(byCity, aes(year, x, fill = factor(year)))
		  + geom_bar(stat = "identity") 
		  + facet_wrap(~ city)
		  + labs(title = expression("Baltimore City vs LA Total Emissions in " * PM[2.5]))
		  + labs(x = "Year", y = expression("Total " * PM[2.5]))
		  + scale_x_continuous(breaks = c(1999, 2002, 2005, 2008)))
	dev.off()
}