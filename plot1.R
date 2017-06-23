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

## Plot the graph in png
png("plot1.png")

with(household_power_consumption,
     hist(Global_active_power, col = "red", main = "Global Active Power",
          xlab = "Global Active Power (kilowatts) "))
dev.off()



