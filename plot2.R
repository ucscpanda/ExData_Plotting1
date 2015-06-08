## Code to create plot 1
## 1. Read in data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   colClasses=c("character","character",rep("numeric",7)), na.strings = "?")

## 2. Convert Dates
data$date_time <- paste(data$Date,data$Time)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$date_time <- strptime(data$date_time, format = "%d/%m/%Y %H:%M:%S")

## 3. Subset to only the relvent dates
data <- subset(data, Date == "2007-02-02" | Date == "2007-02-01")

## 4. Create Plot

with(data, plot(date_time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

## 5. Copy to png file
dev.copy(png, file = "plot2.png")
dev.off()