#Load the ggplot2 package
library (ggplot2)

#Check the data set 
str (PM25)
str (Sourceccode)

#Find the column that contains comb in SCC.Level.One column
combustion <-grepl("comb", Sourceccode$SCC.Level.One, ignore.case=TRUE)
#Find the column that contains coal in SCC.Level.Four column
coal <- grepl("coal", Sourceccode$SCC.Level.Three, ignore.case=TRUE)
#Combine the result 
CoalComb <- (coal & combustion)
#Subset the sourceccode with the CoalComb value 
sourcesubset <- subset (Sourceccode, CoalComb == TRUE)
#Take the value of SCC that matches with comb or coal 
SCCcoalcomb <-sourcesubset$SCC

#Subset PM25 with the condition that PM25$SCC = SCCcoalcomb
newsource <- subset (PM25, PM25$SCC %in% SCCcoalcomb)
#Aggregate the result 
Coalbyyearandtype<-aggregate(Emissions ~ year + type, newsource, sum)
#Plot the graph
plot4 <- ggplot(Coalbyyearandtype, aes(year, Emissions, color = type)) + geom_line()+ggtitle ('Coal combustion emissions - 1998 to 2008') + theme(legend.position = c(0.9, 0.88))+theme(plot.title = element_text(hjust = 0.5))
#Save the graph
ggsave(plot4, file="plot4.png")
dev.off ( )