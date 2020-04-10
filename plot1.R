library(data.table)
getwd()
setwd("/Users/glibburiak/R/Git/ExData_Plotting1")

EPCDT <- data.table::fread(input = "household_power_consumption.txt"
                                      , na.strings="?")
head(EPCDT)
str(EPCDT)

#Changing "$Data" column to Date Type
EPCDT$Date <- as.Date.character(EPCDT$Date, "%d/%m/%Y")

#Subset Dates for 2007-02-01 and 2007-02-02

EPCDT <- EPCDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## Plot 1
hist(EPCDT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
