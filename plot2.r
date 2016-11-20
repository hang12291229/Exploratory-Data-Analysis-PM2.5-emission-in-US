# Subset the data that related to Baltimore into BaltimorePM25
BaltimorePM25 <- subset(PM25, fips == "24510")

# Same as graph 1,  we can use tapply to see the distribution of the data
BaltimorePM25byyear <- tapply(BaltimorePM25$Emissions, BaltimorePM25$year, sum)

# Start the png device 
png(filename = 'plot2.png',units='px')

# Use the statistics in the tapply to draft the graph
plot2 <- barplot(BaltimorePM25byyear,xlab = "Year", ylab = "PM2.5 Emissions (Tons) ", main = "Total PM 2.5 Emissions (tons)")

# Save as plot2.png file
dev.off ( )