## Question 1:Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

# Read the summarySCC_PM25.rds into PM25
PM25 <- readRDS("summarySCC_PM25.rds")

# Read the Source Classification Code in to Sourceccode
Sourceccode  <- readRDS("Source_Classification_Code.rds")

# Check the data 
str (PM25)
str (Sourceccode)

# Use tapply to see the distribution of the data 
PM25byyear <- tapply(PM25$Emissions, PM25$year, sum)
PM25byyear

# Start the png device 
png(filename = 'plot1.png',units='px')

# Use the statistics in the tapply table to plot the graph
plot1 <- barplot(PM25byyear,xlab = "Year", ylab = "PM2.5 Emissions (Tons) ", main = "Total PM 2.5 Emissions (tons)")

# Save as plot1.png file
dev.off ( )