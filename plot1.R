# plot1.R - Histogram of Global Active Power

library(sqldf)

# Read data, convert dates and subset on two days in February 2007
hh <- read.csv.sql("household_power_consumption.txt", 
				sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"', 
				header=TRUE, 
				sep=";",
				colClasses=c("Date", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# Open plot1.png
png("plot1.png", height=480, width=480)

# Build histogram
hist(hh$Global_active_power, col='red', 
     xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')

# Close PNG file
dev.off()
