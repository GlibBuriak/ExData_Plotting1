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

png("plot3.png", width=480, height=480)

# Plot 3
plot(EPCDT[, dateTime], EPCDT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(EPCDT[, dateTime], EPCDT[, Sub_metering_2],col="red")
lines(EPCDT[, dateTime], EPCDT[, Sub_metering_3],col="blue")
legend("topright", 
       col=c("black","red","blue"), 
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
       lty=c(1,1), lwd=c(1,1))

dev.off()
