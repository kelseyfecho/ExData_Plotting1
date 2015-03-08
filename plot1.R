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

##Convert Date and Time columns to Date/Time classes and reformat as desired
date <- dmy(data$Date)
time <- strptime(data$Time, "%R:%S")

##Change necessary column classes and subset data to exclude original time and date columns
subset <- data[, 3:9]

##Use cbind to stitch the proper date and time information with the subsetted data from above
final <- cbind(date, time, subset)

##----------------------------------------------------------------------------------------------------------------------------------
##This section contains for code for Plot 1
##Install and load necessary packages
install.packages("datasets")
library(datasets)

##Using the Base Plot method, construct Plot 1 and create a png file.
##I used a white background to maintain consistency across browsers. It has been mentioned that different browsers process transparant backgrounds differently.
png("plot1.png", width = 480, height = 480, bg = "white")
hist(final$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()