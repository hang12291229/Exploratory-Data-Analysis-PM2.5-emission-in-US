#Load the ggplot2 package
library (ggplot2)

# FIlter observations related to Baltimore MD
BaltimorePM25 <- subset(PM25, fips == "24510")

## Subsetting Baltimore data and aggregating data by year, type and emissions i.e Emission from different types in different years 
BaltimorePM25newdataset<-aggregate(Emissions ~ year + type, BaltimorePM25, sum)

##Plot the base in the ggplot, Add the title and move the legend to top right
plot3<-ggplot(BaltimorePM25newdataset, aes(year, Emissions, color = type))+ geom_line()+ggtitle('Baltimore Emission from 1999 to 2008 ')+ theme(legend.position = c(0.9, 0.88))
plot3

# Save as plot3.png file
ggsave(plot3, file="plot3.png")
dev.off( )
