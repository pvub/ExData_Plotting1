# plot2.R - Time Series of Global Active Power

library(sqldf)

# Read data, convert dates and subset on two days in February 2007
hh <- read.csv.sql("household_power_consumption.txt", 
				sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"', 
				header=TRUE, 
				sep=";",
				colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

hh$DateTime <- strptime(paste(hh$Date, hh$Time), "%d/%m/%Y %H:%M:%S")

# Open plot2.png
png("plot2.png", height=480, width=480)

# Build time series
plot(hh$DateTime, 
     hh$Global_active_power, 
     pch=NA, 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(hh$DateTime, hh$Global_active_power)


# Close PNG file
dev.off()
