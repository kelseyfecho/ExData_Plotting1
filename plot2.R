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
##This section contains for code for Plot 2
##Install and load necessary packages
install.packages("datasets")
library(datasets)

##Export Plot 2 to a PNG file
##A white background is used to maintain consistent athetics across different browser types
png("plot2.png", width = 480, height = 480, bg = "white")
with(final, plot(date_time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = " "))
dev.off()
