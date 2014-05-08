# plot3.R - Time Series of Global Active Power by submeter

library(sqldf)

# Read data, convert dates and subset on two days in February 2007
data <- read.csv.sql("household_power_consumption.txt", 
				sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"', 
				header=TRUE, 
				sep=";",
				colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Open plot3.png
png("plot3.png", height=480, width=480)

# Build time series
plot(data$DateTime, 
     data$Sub_metering_1, 
     pch=NA, 
     xlab="", 
     ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col='red')
lines(data$DateTime, data$Sub_metering_3, col='blue')
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'))


# Close PNG file
dev.off()
