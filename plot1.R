## Code to create plot 1
## 1. Read in data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   colClasses=c("character","character",rep("numeric",7)), na.strings = "?")

## 2. Convert Dates
data$Date <- as.Date(data$Date, "%d/%m/%Y")

## 3. Subset to only the relvent dates
data <- subset(data, Date == "2007-02-02" | Date == "2007-02-01")

## 4. Create Histogram
hist(data$Global_active_power, col = 'red', main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
## 5. Copy to png file
dev.copy(png, file = "plot1.png")
dev.off()