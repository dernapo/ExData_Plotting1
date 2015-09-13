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

png(file = "plot1.png", width = 480, height = 480)

hist(data$Global_active_power, 
     xlab="Global Active Power (kilowatts)",  ## Add a x-axis label 
     col="red",  ## Add a color 
     main = "Global Active Power")  ## Add a title

dev.off() ## close the PNG device

