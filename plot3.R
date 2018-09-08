
## load the data and data file is in the current wd
data <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")
# convert the date variable to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
data$dateTime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")


data$dateTime <- as.POSIXct(data$dateTime)

# plot3 generating

plot(data$Sub_metering_1 ~ data$dateTime, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(data$Sub_metering_2 ~ data$dateTime, col = "Red")
lines(data$Sub_metering_3 ~ data$dateTime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
