# Exploratory Data and Analysis Project1
# the datafile should be in the current working dirtory
# read and only focus on the data from 1/2/2007-2/2/2007

datafile <- read.table("household_power_consumption.txt", skip = 66637, nrows = 2880,sep = ";") 

# only select the data and clear unrelavent variable and make it numeric

subsetData <- datafile %>% select(V3)  %>% mutate(V3 = as.numeric(as.character(V3)))


hist(datafile$V3, col = "red", main = "Global Active Power", xlab = "Global Active Power (killowatts)", ylab = "Frequency")
dev.copy(png, file ="plot1.png", width = 480, height = 480)
dev.off()
