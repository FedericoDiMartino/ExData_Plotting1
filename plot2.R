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
png("plot2.png")

plot(combinedtime, household_power_consumption$Global_active_power, type = "l", ann = FALSE)
title(ylab = "Global Active Power (kilowatts)")

dev.off()



