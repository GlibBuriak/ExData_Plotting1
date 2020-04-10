library(data.table)
getwd()
setwd("/Users/glibburiak/R/Git/ExData_Plotting1")

EPCDT <- data.table::fread(input = "household_power_consumption.txt"
                           , na.strings="?")
head(EPCDT)
str(EPCDT)
#Changing "$Data" column to Date Type
EPCDT$dateTime <- as.POSIXct(paste(EPCDT$Date, EPCDT$Time), format = "%d/%m/%Y %H:%M:%S")

#Subset Dates for 2007-02-01 and 2007-02-02

EPCDT <- EPCDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)

# Plot 2
plot(x = EPCDT[, dateTime], 
     y = EPCDT[, Global_active_power], 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
