# read the data between 1/2/2007 and 2/2/2007
data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

# clearing name row and unrelevant variables, casting to right classes
data <- data %>% mutate(V1 = as.POSIXct(dmy_hms(as.character(paste(V1, V2)))),
                        V3 = as.numeric(as.character(V3))) %>% select(V1,V3)
png("plot2.png", width=480, height=480)
# create plot using with
with(data, plot(V1,V3, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
