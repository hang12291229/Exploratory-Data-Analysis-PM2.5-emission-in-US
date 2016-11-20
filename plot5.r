# Filter with regular expression names containing "Vehicles" or "vehicles"
vehiclesdataset <- subset (Sourceccode, grepl("Vehicle", Short.Name,ignore.case = TRUE ))

# Subset the vehicles that match with the SCC record in vehicle dataset 
vehiclesPM25<-subset(PM25, SCC %in% vehiclesdataset$SCC)

# Further subset the vehicles observations that take place in Baltimore
vehiclesPM25<-vehiclesPM25[vehiclesPM25$fips == "24510",]

# Aggregate the sum and prepare the chart
vehiclesPM25dataset<-aggregate(Emissions ~ year, vehiclesPM25, sum)

# Plot the graph
plot5 <- ggplot(vehiclesPM25dataset, aes(year, Emissions)) + geom_line()+ggtitle ('Motor vehicle emissions - 1998 to 2008')+theme(plot.title = element_text(hjust = 0.5))

# Save the graph
ggsave(plot5, file="plot5.png")
dev.off ( )