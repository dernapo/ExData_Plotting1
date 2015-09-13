#########################################################################
# This code is to give answers to que questions of week 1 project of
# Exploratory Data Analysis Course by Coursera
#########################################################################

# Data description: Measurements of electric power consumption in one household 
# with a one-minute sampling rate over a period of almost 4 years. 
# Different electrical quantities and some sub-metering values are available.
# Source: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# Load data
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
con <- unz(temp, "household_power_consumption.txt")
data <- read.table(con, sep=";", header = TRUE, na.strings="?") # Convert "?" to NAs
unlink(temp)

#Convert the Date and Time variables to Date/Time classes in R
data$datetime<-strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

#Remove columns Date and Time and place new datetime column on first place
data<-data[,c(10,3:9)]

# Select data just from 2007-02-01 and 2007-02-02
data<-data[data$datetime>="2007-02-01" & data$datetime<"2007-02-03",]

# Create plot

png(file = "plot3.png", width = 480, height = 480)

plot(x= data$datetime,y= data$Sub_metering_1,
     type="n",
     xlab="", ## remove default y-axis label 
     ylab="Energy sub metering")  ## Add a y-axis label 
lines(x= data$datetime, y= data$Sub_metering_1, type="l", col="black")
lines(x= data$datetime, y= data$Sub_metering_2, type="l", col="red")
lines(x= data$datetime, y= data$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1,
       col=c("black","red", "blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))



dev.off() ## close the PNG device