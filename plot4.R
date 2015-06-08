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
par(mfrow = c(2,2))

with(data, plot(date_time, Global_active_power, type = "l", ylab = "Global Active Power", xlab = ""))

with(data, plot(date_time, Voltage, type = "l"))

with(data, plot(date_time, Sub_metering_1, ylab = "Energy Sub Metering", xlab = "", type = "l"))
with(data, lines(date_time, Sub_metering_2, col = "red"))
with(data, lines(date_time, Sub_metering_3, col = "blue"))
legend("topright", pch = "_", col = c("black", "red", "blue"), legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))

with(data, plot(date_time, Global_reactive_power, type = "l"))
## 5. Copy to png file
dev.copy(png, file = "plot4.png")
dev.off()