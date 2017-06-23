## Load required packages
whichinstalledpackages <- installed.packages()

if("sqldf" %in% whichinstalledpackages == TRUE)
{
    library(sqldf)
} else {
    install.packages(sqldf)
    library(sqldf)
}

## Done loading required packages


## Read necessary data into R
household_power_consumption <- read.csv.sql("household_power_consumption.txt",
                                            sep = ';', header = TRUE,
                                            sql="select * from file where Date 
                                            in ('1/2/2007', '2/2/2007')")

closeAllConnections()
## Done reading


## Combine Date and Time columns
pasted_datestimes <- paste(household_power_consumption$Date, household_power_consumption$Time)
##

## Convert combined column to POSIXlt class
combinedtime <- strptime(pasted_datestimes, format = "%d/%m/%Y %H:%M:%S")





## Plot the graph in png
png("plot3.png")

plot(combinedtime, household_power_consumption$Sub_metering_1, type= "l",
     lty = 1 ,xlab = "", ylab = "")
lines(combinedtime, household_power_consumption$Sub_metering_2, col = "red")
lines(combinedtime, household_power_consumption$Sub_metering_3, col = "blue")
title( ylab ="Energy sub metering")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty= 1, col = c("black", "red", "blue"))

dev.off()