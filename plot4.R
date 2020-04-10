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

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# Plot 4.1
plot(EPCDT[, dateTime], EPCDT[, Global_active_power], type="l", xlab="", ylab="Global Active Power")

# Plot 4.2
plot(EPCDT[, dateTime],EPCDT[, Voltage], type="l", xlab="datetime", ylab="Voltage")

# Plot 4.3
plot(EPCDT[, dateTime], EPCDT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(EPCDT[, dateTime], EPCDT[, Sub_metering_2], col="red")
lines(EPCDT[, dateTime], EPCDT[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

# Plot 4.4
plot(EPCDT[, dateTime], EPCDT[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
