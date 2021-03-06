##This section reads in the data and prepares it for plots. Scroll to section 2 for plot code
##Set working directory to the folder for Course Project 1

##Install and load necessary packages
install.packages("lubridate")
library(lubridate)
##The lubridate package will be used for working with date and time values later on.

##Read in pre-subsetted data set for 2007-02-01 and 2007-02-02
##This method of data subsetting was approved by a Coursera Community TA in 
##in the discussion forums.

data <- read.table("datasubset.txt", header = FALSE, sep = ";",
				col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Paste date and time columns together so that proper date and time fields are read in
date_time <- paste(data$Date, data$Time)

##Convert date_time to Date/Time classes and reformat as desired
date_time <- as.POSIXct(strptime(date_time,format="%d/%m/%Y %H:%M:%S"))

##Change necessary column classes and subset data to exclude original time and date columns
subset <- data[, 3:9]

##Use cbind to stitch the proper date and time information with the subsetted data from above
final <- cbind(date_time, subset)

##----------------------------------------------------------------------------------------------------------------------------------
##This section contains for code for Plot 4
##Install and load necessary packages
install.packages("datasets")
library(datasets)

##Export Plot 4 to a PNG file
##A white background is used to maintain consistency across browser types
png("plot4.png", width = 480, height = 480, bg = "white")
par(mfrow = c(2, 2))
plot(final$date_time, final$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = " ")
plot(final$date_time, final$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
plot(final$date_time, final$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = " ")
lines(final$date_time, final$Sub_metering_2, col = "red")
lines(final$date_time, final$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(final$date_time, final$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()
