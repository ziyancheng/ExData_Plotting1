
# This script is for week1 project to plot 4
# The file is on the current working directory

# load the data

rm(list =ls())
data <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")
# convert the date variable to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data between 1/2/2007- 2/2/2007
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times 
data$dateTime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# add a new column as POSIXct data typ
data$dateTime <- as.POSIXct(data$dateTime)

# passing 4 graph on the 2 columns and 2 rows
par(mfrow =c(2,2))

attach(data)

plot(data$Global_active_power ~ data$dateTime, type = "l", ylab = "Global Active Power", xlab = " ")
plot(data$Voltage ~ data$dateTime, type = "l", ylab = "Voltage", xlab = "datetime")
plot(Sub_metering_1 ~ dateTime, type = "l", ylab = "Energy sub metering", 
     xlab = "")
lines(Sub_metering_2 ~ dateTime, col = "Red")
lines(Sub_metering_3 ~ dateTime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

plot(Global_reactive_power ~ dateTime, type = "l")
